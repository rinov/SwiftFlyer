//
//  ViewController.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright (c) 2017 Ryo Ishikawa. All rights reserved.
//

import UIKit
import SwiftFlyer

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "ExecutionHistoryCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "CELL")
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    fileprivate var executions: [Execution] = []

    private let realtime: RealTimeAPI = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set realtime api delegate for get your setted object from PubNub.
        realtime.delegate = self

        // Fetch execution histories from bitFlyer lightning(FX).
        let request = GetExecutionsRequest(productCode: .fx_btc_jpy, count: 50)
        
        // Sending a request
        ApiSession.shared.send(request) { [weak self] result in
            guard let me = self else { return }
            switch result {
            case .success(let executions):
                me.executions = executions
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failed(let e):
                print("Error=\(e)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return executions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? ExecutionHistoryCell else { return UITableViewCell() }
        
        let item = executions[indexPath.row]
        cell.side.text = item.side.rawValue
        cell.price.text = String(item.price)
        cell.size.text = String(item.size)
        cell.execDate.text = "\(item.execDate.prefix(10))"
        return cell
    }
}

// MARK: - RealTimeAPIDelegate
extension UIViewController: RealTimeAPIDelegate {
    public func didReceiveSnapShot(_ snapshot: Board) {
        print(snapshot)
    }
    
    public func didReceiveBoardDiff(_ board: Board) {
        print(board)
    }
    
    public func didReceiveTicker(_ ticker: Ticker) {
        print(ticker)
    }
    
    public func didReceiveExecution(_ executions: [Execution]) {
        print(executions)
    }
}
