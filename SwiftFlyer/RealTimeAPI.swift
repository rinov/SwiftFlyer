//
//  RealTimeAPI.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation
import SwiftWebSocket

public final class RealTimeAPI: NSObject {

    public static let shared = RealTimeAPI()

    public enum SubscribeChannel {
        public enum SnapShot: String {
            case boardSnap_btc_jpy = "lightning_board_snapshot_BTC_JPY"
            case boardSnap_eth_btc = "lightning_board_snapshot_ETH_BTC"
            case boardSnap_bch_btc = "lightning_board_snapshot_BCH_BTC"
            case boardSnap_fx_btc_jpy = "lightning_board_snapshot_FX_BTC_JPY"
            
            public var targetChannel: String {
                return self.rawValue
            }
        }

        public enum Board: String {
            case board_btc_jpy = "lightning_board_BTC_JPY"
            case board_eth_btc = "lightning_board_ETH_BTC"
            case board_bch_btc = "lightning_board_BCH_BTC"
            case board_fx_btc_jpy = "lightning_board_FX_BTC_JPY"
            
            public var targetChannel: String {
                return self.rawValue
            }
        }

        public enum Ticker: String {
            case ticker_btc_jpy = "lightning_ticker_BTC_JPY"
            case ticker_eth_btc = "lightning_ticker_ETH_BTC"
            case ticker_bch_btc = "lightning_ticker_BCH_BTC"
            case ticker_fx_btc_jpy = "lightning_ticker_FX_BTC_JPY"
            
            public var targetChannel: String {
                return self.rawValue
            }
        }

        public enum Execution: String {
            case execution_btc_jpy = "lightning_executions_BTC_JPY"
            case execution_eth_btc = "lightning_executions_ETH_BTC"
            case execution_bch_btc = "lightning_executions_BCH_BTC"
            case execution_fx_btc_jpy = "lightning_executions_FX_BTC_JPY"
            
            public var targetChannel: String {
                return self.rawValue
            }
        }
    }

    public weak var delegate: RealTimeAPIDelegate?

    private struct JSONRPC: Decodable {
        let version: String
        let method: String
        let params: RPCResponse
        
        enum CodingKeys: String, CodingKey {
            case version = "jsonrpc"
            case method
            case params
        }
    }
    
    private struct RPCResponse: Decodable {
        let channel: String
        let snapshot: Board?
        let board: Board?
        let ticker: Ticker?
        let executions: [Execution]?
        
        enum CodingKeys: String, CodingKey {
            case channel
            case message
        }
        
        init(from decoder: Decoder) throws {
            let root = try decoder.container(keyedBy: CodingKeys.self)
            self.channel = try root.decode(String.self, forKey: .channel)

            if channel.hasPrefix("lightning_board_snapshot") {
                self.snapshot = try root.decode(Board.self, forKey: .message)
            } else {
                self.snapshot = nil
            }
            
            if channel.hasPrefix("lightning_board") {
                self.board = try root.decode(Board.self, forKey: .message)
            } else {
                self.board = nil
            }

            if channel.hasPrefix("lightning_ticker") {
                self.ticker = try root.decode(Ticker.self, forKey: .message)
            } else {
                self.ticker = nil
            }

            if channel.hasPrefix("lightning_executions") {
                self.executions = try root.decode([Execution].self, forKey: .message)
            } else {
                self.executions = nil
            }
        }
    }

    private struct LSRequest: Encodable {
        let method: String
        let params: [String: String]
    }

    private let webSocket = WebSocket("wss://ws.lightstream.bitflyer.com/json-rpc")
    private let decoder = JSONDecoder()
    
    private override init() {
        super.init()
        webSocket.event.message = { [weak self] message in
            guard let me = self,
                let json = message as? String,
                let data = json.data(using: .utf8),
                let response = try? JSONDecoder().decode(JSONRPC.self, from: data) else { return }

            if let snapshot = response.params.snapshot {
                me.delegate?.didReceiveSnapShot(snapshot)
            } else if let board = response.params.board {
                me.delegate?.didReceiveBoardDiff(board)
            } else if let ticker = response.params.ticker {
                me.delegate?.didReceiveTicker(ticker)
            } else if let executions = response.params.executions {
                me.delegate?.didReceiveExecution(executions)
            }
        }
    }
    
    public func subscribe(with channels: [String]) {
        webSocket.event.open = { [weak self] in
            guard let me = self else { return }
            channels.forEach { channelName in
                let request = LSRequest(method: "subscribe", params: ["channel": channelName])
                guard let data = try? JSONEncoder().encode(request),
                    let json = String(data: data, encoding: .utf8) else { return }
                me.webSocket.send(json)
            }
        }
    }
}
