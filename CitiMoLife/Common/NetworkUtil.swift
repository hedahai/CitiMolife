//
//  NetUtil.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/14.
//  Copyright © 2018年 tiny. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class NetworkUtil: NSObject {
    
    static let networkUtil = NetworkUtil()
    
    struct responseData {
        var request:URLRequest?
        var response:HTTPURLResponse?
        var json:AnyObject?
        var error:NSError?
        var data:Data?
    }
    
    
    var reachAble:Bool = {
        var reach = true
        
        let manager = NetworkReachabilityManager(host: "www.baidu.com")
        
        manager?.listener = { status in
            switch status {
            case .notReachable:
                reach = false
            case .reachable(.ethernetOrWiFi):
                reach = true
            case .reachable(.wwan):
                reach = true
            case .unknown:
                reach = false
            }
        }
        manager?.startListening()
        
        return reach
    }()
    
    class func requestWith(Method method:Alamofire.HTTPMethod, URL url:String, Parameter para:[String:Any]?, Token token:String?, handler: @escaping (responseData) -> Void){
        let reachAble = NetworkUtil.networkUtil.reachAble
        if reachAble {
            var dicToken:[String:String]!
            if token != nil {
                dicToken = ["tokenId":token!]
            }
            
            let manager = Alamofire.SessionManager.default
            manager.session.configuration.timeoutIntervalForRequest = 10
            manager.request(url, method: method, parameters: para, encoding: URLEncoding.default, headers: dicToken).response(completionHandler: { (response) in
                let json:AnyObject! = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as AnyObject
                if nil != json {
                    let res = responseData(request:response.request, response:response.response, json:json, error:response.error as NSError?, data:response.data)
                    
                    handler(res)
                }
            })
            
        }
    }
    

}

class DataFactory: NSObject {
    
    let dataFortory = DataFactory()
    
    struct result {
        var succ:Bool = false
        var mesg:String?
        var res_data:[String:Any]?
        var res_code:String?
    }
    
    //公用消息头参数先定义好
    var localPara:[String:Any] = ["appkey":"APP_KEY"]
    
    func handleResponse(JSON json:JSON) -> result{
        
        return result(succ:true, mesg:json["res_msg"].string, res_data:json["res_data"].dictionary, res_code:json["res_code"].string)
    }
    
    func getHotCities(Handler comp:@escaping((result) -> Void)) {
        NetworkUtil.requestWith(Method: .post, URL: "", Parameter: localPara, Token: nil) { (res) in
            do {
                let json = try JSON(data:res.data!)
                if JSON.null != json {
                    let aResult = self.handleResponse(JSON: json)
                    comp(aResult)
                }
            }catch{}
        }
    }
}
