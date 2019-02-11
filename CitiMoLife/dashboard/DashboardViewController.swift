//
//  DashboardViewController.swift
//  CitiMoLife
//
//  Created by 何大海 on 2019/1/31.
//  Copyright © 2019年 tiny. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class DashboardViewController: UIViewController,WKNavigationDelegate,WKUIDelegate {
    
    let loginImage = UIImageView(frame: CGRect(x:0, y:0, width:SCREEN_WIDTH, height:SCREEN_HEIGHT))
    
    let webview = WKWebView(frame: CGRect(x:0, y:5, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-5))
    
    var progressView = UIProgressView()
    
    var url:String?
    var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginImage.image = UIImage(named: "LoginImage")
        loginImage.tag = 1002
        
        self.view.addSubview(loginImage)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.loginImage.image = UIImage(named: "TouchIDImage")
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            self.loginImage.image = UIImage(named: "dsd")
        }
    }
    
}
