//
//  AppDelegate.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/27.
//  Copyright (c) 2017 Ryo Ishikawa. All rights reserved.
//

import UIKit
import SwiftFlyer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // (Optional) Set your API keys, if you access to private API.
        BitFlyer.apiKey = "Your API Key"
        BitFlyer.apiSecretKey = "Your API Secret Key"
     
        // (Optional) If you want retrive realtime information, set channels and call `subscribe` of RealTimeAPI.
        typealias Channel = RealTimeAPI.SubscribeChannel

        // Set channels for subscribing realtime api from bitFlyer RealTimeAPI by using JSON RPC over WebSocket.
        let subscribeChannels: [String] = [
            Channel.SnapShot.boardSnap_fx_btc_jpy.targetChannel,
            Channel.Board.board_fx_btc_jpy.targetChannel,
            Channel.Ticker.ticker_fx_btc_jpy.targetChannel,
            Channel.Execution.execution_fx_btc_jpy.targetChannel
        ]

        // Start observing realtime API.
        RealTimeAPI.shared.subscribe(with: subscribeChannels)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}

