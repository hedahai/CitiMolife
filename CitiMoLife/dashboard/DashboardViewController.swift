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
    
    let webview = WKWebView(frame: CGRect(x:0, y:0, width:SCREEN_WIDTH, height:SCREEN_HEIGHT))
    
    let loadingUIBackground = UIView(frame: CGRect(x:0, y:0, width:SCREEN_WIDTH, height:SCREEN_HEIGHT))
    let activityInd = UIActivityIndicatorView(frame: CGRect(x:0, y:0, width:50.0, height:50.0))
    
    var url:String?
    var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = "https://www.mrtiny.cn/dashboard.html"
        
        loginImage.image = UIImage(named: "LoginImage")
        loginImage.tag = 1002
        
        self.view.addSubview(loginImage)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.loginImage.image = UIImage(named: "TouchIDImage")
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            self.showWebView()
        }
    }
    
    func showWebView(){
        print("Start create WebView")
        
        self.view.backgroundColor = UIColor.white
        webview.navigationDelegate = self;
        webview.uiDelegate = self;
        var request = NSURLRequest(url: NSURL(string:url!)! as URL) as URLRequest
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        webview.load(request)
        webview.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        //clearBrowserCache()
        //webview.clearsContextBeforeDrawing(true)

        self.view.addSubview(webview)
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            if webview.estimatedProgress >= 1.0 {
                let subViews = self.view.subviews
                for subview in subViews{
                    if (subview.tag == 1002 || subview.tag == 1003) {
                        print("for removing...")
                        subview.removeFromSuperview()
                    } else {
                        print("not removing..")
                    }
                }
                activityInd.stopAnimating()
            }
            print(webview.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start Loading")
        
        loadingUIBackground.tag = 1003
        loadingUIBackground.backgroundColor = UIColor.black
        loadingUIBackground.alpha = 0.8
        
        activityInd.center = self.view.center
        activityInd.style = UIActivityIndicatorView.Style.white
        loadingUIBackground.addSubview(activityInd)
        
        
        self.view.addSubview(loadingUIBackground)
        
        activityInd.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Start Fetch Web Page")
        
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow);
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
    }
    
    func clearBrowserCache() {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), completionHandler: { (records) in
            for record in records{
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {
                    print("清除成功\(record)")
                })
            }
        })
    }
    
    deinit {
        print("==LoginViewController deinit==")
        webview.removeObserver(self, forKeyPath: "estimatedProgress")
        webview.uiDelegate = nil
        webview.navigationDelegate = nil
    }
}
