//
//  LoginViewController.swift
//  CitiMoLife
//
//  Created by 何大海 on 2019/1/28.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class LoginViewController: UIViewController,WKNavigationDelegate,WKUIDelegate {
    
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
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
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
        
        progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 5))
        progressView.trackTintColor = UIColor.white
        progressView.progressTintColor = UIColor.orange
        //self.navigationController?.navigationBar.addSubview(progressView)
       
        self.view.addSubview(webview)
        self.view.addSubview(progressView)
        self.view.bringSubviewToFront(self.progressView)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            progressView.alpha = 1.0
            //progressView.isHidden = webview.estimatedProgress == 1
            progressView.setProgress(Float(self.webview.estimatedProgress), animated: true)
            if webview.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut, animations: {
                    self.progressView.alpha = 0
                }, completion: { (finish) in
                    self.progressView.setProgress(0.0, animated: false)
                })
                let subViews = self.view.subviews
                for subview in subViews{
                    if (subview.tag == 1002) {
                        print("for removing...")
                        subview.removeFromSuperview()
                    } else {
                        print("not removing..")
                    }
                }
            }
            print(webview.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start Loading")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Start Fetch Web Page")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow);
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
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
        progressView.reloadInputViews()
        webview.uiDelegate = nil
        webview.navigationDelegate = nil
    }
    
    
}
