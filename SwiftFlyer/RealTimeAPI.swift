//
//  RealTimeAPI.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation
import PubNub

public protocol PubNubSubscribable {
    var targetChannel: String { get }
}

public final class RealTimeAPI: NSObject {

    public static let shared = RealTimeAPI()

    /// Common subscribe key of bitFlyer.
    public static let subscribeKey = "sub-c-52a9ab50-291b-11e5-baaa-0619f8945a4f"

    public enum SubscribeChannel {
        public enum SnapShot: String, PubNubSubscribable {
            case boardSnap_btc_jpy = "lightning_board_snapshot_BTC_JPY"
            case boardSnap_eth_btc = "lightning_board_snapshot_ETH_BTC"
            case boardSnap_bch_btc = "lightning_board_snapshot_BCH_BTC"
            case boardSnap_fx_btc_jpy = "lightning_board_snapshot_FX_BTC_JPY"
            
            public var targetChannel: String {
                return self.rawValue
            }
        }

        public enum Diff: String, PubNubSubscribable {
            case board_btc_jpy = "lightning_board_BTC_JPY"
            case board_eth_btc = "lightning_board_ETH_BTC"
            case board_bch_btc = "lightning_board_BCH_BTC"
            case board_fx_btc_jpy = "lightning_board_FX_BTC_JPY"
            
            public var targetChannel: String {
                return self.rawValue
            }
        }

        public enum Ticker: String, PubNubSubscribable {
            case ticker_btc_jpy = "lightning_ticker_BTC_JPY"
            case ticker_eth_btc = "lightning_ticker_ETH_BTC"
            case ticker_bch_btc = "lightning_ticker_BCH_BTC"
            case ticker_fx_btc_jpy = "lightning_ticker_FX_BTC_JPY"
            
            public var targetChannel: String {
                return self.rawValue
            }
        }

        public enum Execution: String, PubNubSubscribable {
            case execution_btc_jpy = "lightning_executions_BTC_JPY"
            case execution_eth_btc = "lightning_executions_ETH_BTC"
            case execution_bch_btc = "lightning_executions_BCH_BTC"
            case execution_fx_btc_jpy = "lightning_executions_FX_BTC_JPY"
            
            public var targetChannel: String {
                return self.rawValue
            }
        }
    }
    
    public var client: PubNub?
    public weak var delegate: RealTimeAPIDelegate?

    private let decoder = JSONDecoder()
    
    private override init() {}
    
    public func subscribe(with channels: [PubNubSubscribable], configuration: PNConfiguration = .defaultConfigure) {
        client = PubNub.clientWithConfiguration(configuration)
        client?.addListener(self)
        client?.subscribeToChannels (channels.map { $0.targetChannel }, withPresence: false)
    }
    
    fileprivate func didReceiveBoardInfo(_ message: Any?) {
        guard let message = message as? [String: Any],
            let _asks = message["asks"] as? [[String: Any]],
            let _bids = message["bids"] as? [[String: Any]],
            let midPrice = message["mid_price"] as? Double
            else { return }
        
        let asks = _asks.flatMap { data -> BoardOrder? in
            guard let price = data["price"] as? Double,
                let size = data["size"] as? Double else { return nil }
            return BoardOrder(price : price, size: size)
        }
        
        let bids = _bids.flatMap { data -> BoardOrder? in
            guard let price = data["price"] as? Double,
                let size = data["size"] as? Double else { return nil }
            return BoardOrder(price : price, size: size)
        }
        
        let board = Board(asks: asks, bids: bids, midPrice: midPrice)
        delegate?.didReceiveBoardDiff(board)
    }
    
    fileprivate func didReceiveExecutions(_ message: Any?) {
        guard let messages = message as? [[String: Any]] else { return }
        
        let executions = messages.flatMap { message -> Execution? in
            guard
                let id = message["id"] as? Int,
                let sideString = message["side"] as? String,
                let side = PositionSide(rawValue: sideString),
                let price = message["price"] as? Double,
                let size = message["size"] as? Double,
                let execDate = message["exec_date"] as? String,
                let buyID = message["buy_child_order_acceptance_id"] as? String,
                let sellID = message["sell_child_order_acceptance_id"] as? String
                else { return nil }
            
            let execution = Execution(id: id,
                                      side: side,
                                      price: price,
                                      size: size,
                                      execDate: execDate,
                                      buyChildOrderAcceptanceID: buyID,
                                      sellChildOrderAcceptanceID: sellID)
            return execution
        }
        
        if executions.isEmpty { return }
        delegate?.didReceiveExecution(executions)
    }
    
    fileprivate func didReceiveTicket(_ message: Any?) {

        guard let message = message as? [String: Any],
            let _productCode = message["product_code"] as? String,
            let productCode = ProductCode(rawValue: _productCode),
            let timeStamp = message["timestamp"] as? String,
            let id = message["tick_id"] as? Int,
            let bestBid = message["best_bid"] as? Double,
            let bestAsk = message["best_ask"] as? Double,
            let bestBidSize = message["best_bid_size"] as? Double,
            let bestAskSize = message["best_ask_size"] as? Double,
            let totalBidDepth = message["total_bid_depth"] as? Double,
            let totalAskDepth = message["total_ask_depth"] as? Double,
            let lastPrice = message["ltp"] as? Double,
            let volume = message["volume"] as? Double,
            let volumeByProduct = message["volume_by_product"] as? Double
            else { return }
        
        let ticker = Ticker(productCode: productCode,
                            timeStamp: timeStamp,
                            tickID: id,
                            bestBid: bestBid,
                            bestAsk: bestAsk,
                            bestBidSize: bestBidSize,
                            bestAskSize: bestAskSize,
                            totalBidDepth: totalBidDepth,
                            totalAskDepth: totalAskDepth,
                            lastPrice: lastPrice,
                            volume: volume,
                            volumeByProduct: volumeByProduct)
        delegate?.didReceiveTicker(ticker)
    }
}

extension PNConfiguration {
    public static var defaultConfigure: PNConfiguration {
        let configuration = PNConfiguration(publishKey: "", subscribeKey: RealTimeAPI.subscribeKey)
        configuration.stripMobilePayload = false
        return configuration
    }
}

// MARK: -　PNObjectEventListener
extension RealTimeAPI: PNObjectEventListener {
    
    // Handle new message from one of channels on which client has been subscribed.
    public func client(_ client: PubNub, didReceiveMessage message: PNMessageResult) {
        let channel = message.data.channel
        
        if let _ = SubscribeChannel.SnapShot(rawValue: channel) {
            didReceiveBoardInfo(message.data.message)
        } else if let _ = SubscribeChannel.Diff(rawValue: channel) {
            didReceiveBoardInfo(message.data.message)
        } else if let _ = SubscribeChannel.Ticker(rawValue: channel) {
            didReceiveTicket(message.data.message)
        } else if let _ = SubscribeChannel.Execution(rawValue: channel) {
            didReceiveExecutions(message.data.message)
        }
    }
}
