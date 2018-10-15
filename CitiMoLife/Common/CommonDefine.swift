//
//  CommonDefine.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/1.
//  Copyright © 2018年 tiny. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let SCREEN_MAX_LENGTH  = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let IS_IPHONE_4_OR_LESS = SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5 = SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_6 = SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P = SCREEN_MAX_LENGTH == 736.0
let IS_IPHONE_X = SCREEN_MAX_LENGTH == 812.0

let STATUS_NAV_BAR_Y:CGFloat = IS_IPHONE_X == true ? 88.0 : 64.0
let TABBAR_HEIGHT:CGFloat = IS_IPHONE_X == true ? 83.0 : 49.0
let STATUSBAR_HEIGHT:CGFloat = IS_IPHONE_X == true ? 44.0 : 20.0

let MENUBAR_HIGHT:CGFloat = (SCREEN_WIDTH/4)*2 + 64

let CITI_BLUE = UIColor.hexadecimalColor(hexadecimal: "#306EFF");
