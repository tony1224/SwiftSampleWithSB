//
//  PullToRefreshView.swift
//  SwiftSampleWithSB
//
//  Created by Morita Jun on 2018/03/24.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

// 引っ張って更新用のViewです。
class PullToRefreshView: UIView {

    @IBOutlet weak var refreshLabel: UILabel!
    @IBOutlet weak var refreshImageView: UIImageView!
    
    func changeLabel(text: String) {
        self.refreshLabel.text = text
    }
    
    // 画像のアニメーション処理です。
    func animateImage() {
        let layer = self.refreshImageView.layer
        let animation = CABasicAnimation(keyPath: "rotation")
        animation.toValue = Double.pi / 2.0
        animation.duration = 0.25
        animation.repeatCount = MAXFLOAT
        animation.isCumulative = true
        layer.add(animation, forKey: "ImageRotation")
    }
    
}
