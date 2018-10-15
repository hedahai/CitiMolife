//
//  Food.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/8.
//  Copyright © 2018年 tiny. All rights reserved.
//

import Foundation

class FoodModel: NSObject {
    
    @objc var name = ""
    @objc var star:Int = 0
    @objc var image = ""
    @objc var location = ""
    @objc var price = ""
    @objc var category = ""
    
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
