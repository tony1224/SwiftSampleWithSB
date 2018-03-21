//
//  UIViewController+Ext.swift
//  SwiftSampleWithSB
//
//  Created by Morita Jun on 2018/03/21.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

extension UIViewController: StoryboardInstantiatable {
    
    // ナビゲーションバー設定
    func setupNavigationBar(title: String) {
        self.title = title
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: UIFont(name: "Nicoca", size: 23)!]
        self.navigationController?.navigationBar.barTintColor = ColorUtil.navigationBarColor
    }

}

protocol StoryboardInstantiatable {}
extension StoryboardInstantiatable where Self: UIViewController {
    
    // SBとクラス名が同じ場合
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
    }
    
    // SBとクラス名が異なる場合
    static func instantiate(withStoryboard storyboard: String) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
    }
    
}
