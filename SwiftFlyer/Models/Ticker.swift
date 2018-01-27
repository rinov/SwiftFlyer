//
//  Ticker.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct Ticker: Codable {
    public let productCode: ProductCode
    public let timeStamp: String
    public let tickID: Int
    public let bestBid: Double
    public let bestAsk: Double
    public let bestBidSize: Double
    public let bestAskSize: Double
    public let totalBidDepth: Double
    public let totalAskDepth: Double
    public let lastPrice: Double
    public let volume: Double
    public let volumeByProduct: Double

    public init(productCode: ProductCode, timeStamp: String, tickID: Int, bestBid: Double, bestAsk: Double, bestBidSize: Double, bestAskSize: Double, totalBidDepth: Double, totalAskDepth: Double, lastPrice: Double, volume: Double, volumeByProduct: Double) {
        self.productCode = productCode
        self.timeStamp = timeStamp
        self.tickID = tickID
        self.bestBid = bestBid
        self.bestAsk = bestAsk
        self.bestBidSize = bestBidSize
        self.bestAskSize = bestAskSize
        self.totalBidDepth = totalBidDepth
        self.totalAskDepth = totalAskDepth
        self.lastPrice = lastPrice
        self.volume = volume
        self.volumeByProduct = volumeByProduct
    }
    
    public enum CodingKeys: String, CodingKey {
        case productCode = "product_code"
        case timeStamp = "timestamp"
        case tickID = "tick_id"
        case bestBid = "best_bid"
        case bestAsk = "best_ask"
        case bestBidSize = "best_bid_size"
        case bestAskSize = "best_ask_size"
        case totalBidDepth = "total_bid_depth"
        case totalAskDepth = "total_ask_depth"
        case lastPrice = "ltp"
        case volume
        case volumeByProduct = "volume_by_product"
    }
}

extension Ticker: Equatable {
    public static func ==(lhs: Ticker, rhs: Ticker) -> Bool {
        return lhs.productCode == rhs.productCode
            && lhs.timeStamp == rhs.timeStamp
            && lhs.tickID == rhs.tickID
            && lhs.bestBid == rhs.bestBid
            && lhs.bestAsk == rhs.bestAsk
            && lhs.bestBidSize == rhs.bestBidSize
            && lhs.bestAskSize == rhs.bestAskSize
            && lhs.totalBidDepth == rhs.totalBidDepth
            && lhs.totalAskDepth == rhs.totalAskDepth
            && lhs.lastPrice == rhs.lastPrice
            && lhs.volume == rhs.volume
            && lhs.volumeByProduct == rhs.volumeByProduct
    }
}
