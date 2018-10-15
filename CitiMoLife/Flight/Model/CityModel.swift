//
//  CityModel.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/14.
//  Copyright © 2018年 tiny. All rights reserved.
//

import Foundation

class CityModel: NSObject {
    
    @objc var name: String = ""
    @objc var imageURL: String = ""
    @objc var cityDescription: String = ""
    
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}

