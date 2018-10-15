//
//  FlightViewController.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/13.
//  Copyright © 2018年 tiny. All rights reserved.
//

import UIKit

class FlightViewController: UIViewController {
    
    let hotCityViewController = HotCityViewController()
    
    lazy var hotCityView:UITableView? = {
        let tableView = UITableView(frame: CGRect(x:10, y:330, width:SCREEN_WIDTH-20, height:255), style: .plain)
        tableView.dataSource = hotCityViewController
        tableView.delegate = hotCityViewController
        tableView.register(HotCityCell.self, forCellReuseIdentifier: "hotCityCellid")
        tableView.backgroundColor = UIColor.white
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let titleView = UILabel()
        titleView.textColor = UIColor.white
        titleView.text = "Flight"
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
        
        hotCityViewController.loadCities()
        hotCityViewController.mainViewContorller = self
        
        let flightSearchView = FlightSearchView()
        flightSearchView.createView()
        flightSearchView.frame = CGRect(x:10, y:75, width:SCREEN_WIDTH-20, height:240)
        flightSearchView.backgroundColor = UIColor.white
        
        self.view.addSubview(flightSearchView)
        self.view.addSubview(hotCityView!)
    }

    @objc func backToPrevious(){
        self.navigationController!.popViewController(animated: true)
    }
    
    @objc func backToHome(){
        self.navigationController!.popToRootViewController(animated: true)
    }
    
}
