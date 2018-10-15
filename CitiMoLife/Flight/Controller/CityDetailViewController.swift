//
//  CityDetailViewController.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/14.
//  Copyright © 2018年 tiny. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    var city:CityModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleView = UILabel()
        titleView.textColor = UIColor.white
        titleView.text = "Hot City \((city?.name)!)"
        self.navigationItem.titleView = titleView
        self.view.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#f5f6f7");
        
        let rightBarBtn = UIBarButtonItem(title: "", style: .plain, target: self,
                                          action: #selector(backToHome))
        self.navigationItem.rightBarButtonItem = rightBarBtn
        rightBarBtn.setBackgroundImage(UIImage(named:"home"), for: UIControl.State.normal, barMetrics: UIBarMetrics.default)
        
        let leftBarBtn = UIBarButtonItem(title: "", style: .plain, target: self,
                                         action: #selector(backToPrevious))
        leftBarBtn.setBackgroundImage(UIImage(named:"back"), for: UIControl.State.normal, barMetrics: UIBarMetrics.default)
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
        let cityImage = UIImageView()
        let url = URL(string: (city?.imageURL)!)
        let data = try! Data(contentsOf: url!)
        let newImage = UIImage(data: data)
        cityImage.image = newImage
        cityImage.frame = CGRect.init(x: 10, y: 70, width: SCREEN_WIDTH-20, height: 200);
        self.view.addSubview(cityImage)
        
        let details = UIView()
        details.frame = CGRect(x:10, y:270, width:SCREEN_WIDTH-20, height:SCREEN_HEIGHT-290)
        details.backgroundColor = UIColor.white
        let cityDescription = Util.createLabelWith(Text: city?.cityDescription, Frame: CGRect(x:0, y:0, width:SCREEN_WIDTH-20, height:70), TextColor: UIColor.black, Font: 12.0, TextAligtment: .left)
        cityDescription.textColor = UIColor.gray;
        details.addSubview(cityDescription)
        self.view.addSubview(details)
        
      
    }
    
    @objc func backToPrevious(){
        self.navigationController!.popViewController(animated: true)
    }
    
    @objc func backToHome(){
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    
 

}
