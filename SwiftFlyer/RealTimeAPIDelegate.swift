//
//  RealTimeAPIDelegate.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//

public protocol RealTimeAPIDelegate: class {
    func didReceiveSnapShot(_ snapshot: Board)
    func didReceiveBoardDiff(_ board: Board)
    func didReceiveTicker(_ ticker: Ticker)
    func didReceiveExecution(_ executions: [Execution])
    func onConnect()
    func onDisconnect(_ error: Error?)
}
