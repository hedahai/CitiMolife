//
//  HotCityDataSource.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/13.
//  Copyright © 2018年 tiny. All rights reserved.
//

import Foundation
import UIKit
class HotCityViewController:UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cities = [CityModel]()
    var mainViewContorller:UIViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotCityCellid", for: indexPath) as! HotCityCell;
        if !cities.isEmpty {
            let model:CityModel = cities[indexPath.row]
            cell.configCellWithModel(CellModel: model)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        let viewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: SCREEN_WIDTH-20, height: 30))
        viewLabel.text = "Hot City:"
        viewLabel.textColor = UIColor.black
        viewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(viewLabel)
        tableView.addSubview(view)
        return view
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath:IndexPath){
    
        let selctedCity:CityModel = cities[indexPath.row]
        let cityDetailViewController = CityDetailViewController()
        cityDetailViewController.city = selctedCity
        
        print(selctedCity)

        mainViewContorller?.navigationController?.pushViewController(cityDetailViewController, animated: true)
        
    }

    func loadCities(){
        let city = CityModel()
        city.setValuesForKeys(["name": "Hong Kong", "imageURL": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539429002857&di=d60df134c682f876e3d1d25e91ea8b2a&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Db9450c61f8d3572c72ef949fe27a0952%2F10dfa9ec8a136327d14499bb9b8fa0ec09fac789.jpg", "cityDescription": "香港（Hong Kong），简称“港”（HK），全称为中华人民共和国香港特别行政区"] as [String : Any])
        cities.append(city)
        
        let city1 = CityModel()
        city1.setValuesForKeys(["name": "Singapore", "imageURL": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539510380474&di=65c72cea878e83666ad796c37e2e1600&imgtype=0&src=http%3A%2F%2Fhiphotos.baidu.com%2Fdoc%2Fpic%2Fitem%2Fb64543a98226cffc7f5e1c3cb0014a90f703eacc.jpg", "cityDescription": "新加坡，旧称新嘉坡、星洲或星岛，别称为狮城，是东南亚的一个岛国"] as [String : Any])
        cities.append(city1)
        
        let city2 = CityModel()
        city2.setValuesForKeys(["name": "Da Lian", "imageURL": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539510317896&di=824834cccca325a5443f255376379f45&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn15%2F764%2Fw2048h1116%2F20180617%2Fb8d1-heauxvy4989193.jpg", "cityDescription": "大连，别称滨城，旧名达里尼、青泥洼，是辽宁省副省级市、计划单列市"] as [String : Any])
        cities.append(city2)
        
    }
    
}
