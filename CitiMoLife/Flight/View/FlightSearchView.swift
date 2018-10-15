//
//  FlightSearchView.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/14.
//  Copyright © 2018年 tiny. All rights reserved.
//

import UIKit

class FlightSearchView: UIView {

    var fromLable:UILabel?
    var fromInput:UITextField?
    var toLable:UILabel?
    var toInput:UITextField?
    var dateLable:UILabel?
    var datePicker:UIDatePicker?
    var dateInput:UITextField?
    var searchBtn:UIButton?
    var exchangeBtn:UIButton?
    
    let flightSearchViewController = FlightSearchViewController()

    func createView(){
        
        fromLable = Util.createLabelWith(Text: "From", Frame: CGRect(x:10, y:10, width:80, height:40), TextColor: UIColor.black, Font: 22.0, TextAligtment: .left)
        self.addSubview(fromLable!)
        fromInput = UITextField(frame: CGRect(x:100, y:10, width:SCREEN_WIDTH-280, height:40))
        fromInput?.placeholder = "上海 shanghai"
        fromInput?.font?.withSize(22.0)
        self.addSubview(fromInput!)
        
        let line_view = Util.createViewWith(Frame: CGRect(x:10, y:((fromLable?.frame.maxY)! + 5.0), width:SCREEN_WIDTH-180, height:1), BackgroundColor: UIColor.gray)
        self.addSubview(line_view)
        
        //exchangeBtn = UIButton(title: "", style: .plain, target: self,action: #selector(exchange))
        
        exchangeBtn = UIButton()
        exchangeBtn?.frame = CGRect(x:(line_view.frame.maxX + 50.0), y:35, width:42, height:40)
        exchangeBtn?.setTitle("", for: .normal)
        exchangeBtn?.setBackgroundImage(UIImage(named:"exchange"), for: UIControl.State.normal)
        exchangeBtn?.addTarget(self, action:#selector(exchange(button:)), for:.touchUpInside)
        //exchangeBtn?.layer.borderColor = UIColor.gray.cgColor
        //exchangeBtn?.layer.borderWidth = 1
        self.addSubview(exchangeBtn!)
        
        toLable = Util.createLabelWith(Text: "To", Frame: CGRect(x:10, y:(line_view.frame.maxY + 5.0), width:80, height:40), TextColor: UIColor.black, Font: 22.0, TextAligtment: .left)
        self.addSubview(toLable!)
        toInput = UITextField(frame: CGRect(x:100, y:(line_view.frame.maxY + 5.0), width:SCREEN_WIDTH-280, height:40))
        toInput?.placeholder = "香港 hongkong"
        toInput?.font?.withSize(22.0)
        self.addSubview(toInput!)
        
        let line_view2 = Util.createViewWith(Frame: CGRect(x:10, y:((toLable?.frame.maxY)! + 5.0), width:SCREEN_WIDTH-50, height:1), BackgroundColor: UIColor.gray)
        self.addSubview(line_view2)
        
        dateLable = Util.createLabelWith(Text: "Date", Frame: CGRect(x:10, y:(line_view2.frame.maxY + 5.0), width:80, height:40), TextColor: UIColor.black, Font: 22.0, TextAligtment: .left)
        self.addSubview(dateLable!)
        dateInput = UITextField(frame: CGRect(x:100, y:(line_view2.frame.maxY + 5.0), width:SCREEN_WIDTH-110, height:40))
        dateInput?.placeholder = "2018-12-31"
        dateInput?.font?.withSize(22.0)
        self.addSubview(dateInput!)
        
        //        datePicker = UIDatePicker()
        //        datePicker?.frame = CGRect(x:10, y:98, width:80, height:40)
        //        self.contentView.addSubview(date!)
        
        let line_view3 = Util.createViewWith(Frame: CGRect(x:10, y:((dateLable?.frame.maxY)! + 5.0), width:SCREEN_WIDTH-50, height:1), BackgroundColor: UIColor.gray)
        self.addSubview(line_view3)
        
        searchBtn = UIButton()
        searchBtn?.frame = CGRect(x:10, y:(line_view3.frame.maxY + 5.0), width:SCREEN_WIDTH-50, height:60)
        searchBtn?.setTitle("OK", for: .normal)
        searchBtn?.titleLabel?.textAlignment = .center
        searchBtn?.backgroundColor = CITI_BLUE
        searchBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        searchBtn?.addTarget(self, action:#selector(searchFlights(button:)), for:.touchUpInside)
        self.addSubview(searchBtn!)
    }
    
    @objc func exchange(button:UIButton) {
        
        var temp:String?
        
        temp = fromInput?.text
        
        fromInput?.text = toInput?.text
        
        toInput?.text = temp
        
    }
    
    @objc func searchFlights(button:UIButton) {
        
        
    }

}
