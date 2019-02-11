//
//  PreLoginViewController.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/17.
//  Copyright © 2018年 tiny. All rights reserved.
//

import UIKit
import WebKit

class PreLoginViewController: UIViewController,WKNavigationDelegate,WKUIDelegate {
    
    let webview = WKWebView(frame: CGRect(x:0, y:5, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-5))
    
    var progressView = UIProgressView()
    
    let loadingImage = UIImageView(frame: CGRect(x:0, y:5, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-5))
    
    let loadingUIBackground = UIView(frame: CGRect(x:0, y:5, width:SCREEN_WIDTH, height:SCREEN_HEIGHT))
    let activityInd = UIActivityIndicatorView(frame: CGRect(x:0, y:5, width:32.0, height:32.0))
    
    
    var url:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        webview.navigationDelegate = self
        webview.uiDelegate = self;
        webview.load(NSURLRequest(url: NSURL(string:url!)! as URL) as URLRequest)
        webview.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    
        progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 5))
        progressView.trackTintColor = UIColor.white
        progressView.progressTintColor = UIColor.orange
        self.navigationController?.navigationBar.addSubview(progressView)
        
        loadingImage.image = UIImage(named: "LaunchImage")
        loadingImage.tag = 1001
        
        self.view.addSubview(webview)
        self.view.addSubview(loadingImage)
       
        
        
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
                    if (subview.tag == 1001) {
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
        print("开始加载")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("开始获取网页内容")
        
        loadingUIBackground.tag = 103
        loadingUIBackground.backgroundColor = UIColor.black
        loadingUIBackground.alpha = 0.8
        
        activityInd.center = self.view.center
        activityInd.style = UIActivityIndicatorView.Style.white
        loadingUIBackground.addSubview(activityInd)
        
        
        self.view.addSubview(loadingUIBackground)
        
        activityInd.startAnimating()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow);
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
        self.navigationItem.title = webView.title
    }
    
    deinit {
        print("con is deinit")
        //webview.removeObserver(self, forKeyPath: "estimatedProgress")
        //progressView.reloadInputViews()
        //webview.uiDelegate = nil
        //webview.navigationDelegate = nil
    }

}
