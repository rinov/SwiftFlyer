//
//  ExecutionHistoryCell.swift
//  SwiftFlyer_Example
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2018年 Ryo Ishikawa. All rights reserved.
//

import Foundation
import UIKit

final class ExecutionHistoryCell: UITableViewCell {
    @IBOutlet weak var side: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var execDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
