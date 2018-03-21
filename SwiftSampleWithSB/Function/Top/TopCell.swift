//
//  TopCell.swift
//  SwiftSampleWithSB
//
//  Created by Morita Jun on 2018/03/21.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

class TopCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    func setData(title: String) {
        self.titleLabel.text = title
    }
    
}
