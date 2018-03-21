//
//  NSObject+Ext.swift
//  SwiftSampleWithSB
//
//  Created by Morita Jun on 2018/03/21.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }

}
