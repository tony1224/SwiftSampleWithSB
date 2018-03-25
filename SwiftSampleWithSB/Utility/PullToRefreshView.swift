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
    
    // 画像のアニメーション開始処理です。
    func startRotation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0.0
        animation.toValue = Double.pi / 2.0
        animation.duration = 0.25
        animation.repeatCount = Float.infinity
        self.refreshImageView.layer.add(animation, forKey: "kRotationAnimationKey")
    }
    
    // 画像のアニメーション停止処理です。
    func stopRotation() {
        self.refreshImageView.layer.removeAnimation(forKey: "kRotationAnimationKey")
    }
    
}
