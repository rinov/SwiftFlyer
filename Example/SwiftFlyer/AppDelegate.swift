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

        // For access private API.
        BitFlyer.apiKey = "Your API Key"
        BitFlyer.apiSecretKey = "Your API Secret Key"

        // These are optional settings.
        // If you want retrive realtime information from PubNub, set channels and call `subscribe` of RealTimeAPI.
        typealias Channel = RealTimeAPI.SubscribeChannel

        // Set channels for subscribing realtime api from PubNub.
        let subscribeChannels: [PubNubSubscribable] = [
//            Channel.Ticker.ticker_fx_btc_jpy
        ]

        // Start observing realtime api.
        RealTimeAPI.shared.subscribe(with: subscribeChannels)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}

