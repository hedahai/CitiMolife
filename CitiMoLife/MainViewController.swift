//
//  ViewController.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/1.
//  Copyright © 2018年 tiny. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource{
    
    lazy var  collectionView: UICollectionView? = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: SCREEN_WIDTH/4, height: SCREEN_WIDTH/4)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:SCREEN_WIDTH, height:MENUBAR_HIGHT), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(MenuItemCell.self, forCellWithReuseIdentifier: "CellId")
        
        return collectionView
    }()
    
    lazy var recommondImage: UIImageView? = {
        let recommondImage: UIImageView = UIImageView()
        recommondImage.image = UIImage(named:"recommond")!
        //recommondImage.contentMode = UIView.ContentMode.scaleAspectFit
        recommondImage.frame = CGRect.init(x: 0, y: MENUBAR_HIGHT, width: SCREEN_WIDTH, height: 180);
        return recommondImage
    }()
    
    lazy var foodsView:UITableView? = {
        let tableView = UITableView(frame: CGRect(x:0, y:MENUBAR_HIGHT + 180, width:SCREEN_WIDTH, height:SCREEN_HEIGHT - MENUBAR_HIGHT - 180), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FoodCell.self, forCellReuseIdentifier: "foodCellid")
        tableView.backgroundColor = UIColor.white
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        self.setTopMenu()
        self.configMenuView()
        self.prepareMenuData()
        self.view.addSubview(collectionView!)
        self.view.addSubview(recommondImage!)
        self.prepareFoodData()
        self.view.addSubview(foodsView!)
        foodsView?.estimatedRowHeight = 55.0
        foodsView?.rowHeight = UITableView.automaticDimension
    }
    
    func setTopMenu(){
        
        let titleView = UILabel()
        titleView.textColor = UIColor.white
        titleView.text = "Citi MoLife"
        self.navigationItem.titleView = titleView
        let rightBtn = UIBarButtonItem(title: "DL", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.location))
        rightBtn.tintColor = UIColor.white
        let rightBtn2 = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.location))
        rightBtn2.setBackgroundImage(UIImage(named:"location"), for: UIControl.State.normal, barMetrics: UIBarMetrics.default)
        
        let personIcon = UIImage(named:"person")
        let leftBtn = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.profile))
        leftBtn.setBackgroundImage(personIcon, for: UIControl.State.normal, barMetrics: UIBarMetrics.default)
  
        self.navigationItem.setLeftBarButton(leftBtn, animated: true)
        self.navigationItem.setRightBarButtonItems([rightBtn2, rightBtn], animated: true)
    }
    
    @objc func location(){
        
    }

    @objc func profile(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configMenuView(){
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    var menuData = [MenuItemModel]()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! MenuItemCell;
        cell.createMenuItemCellWith(Section: indexPath.section, Row: indexPath.row)
        if !menuData.isEmpty {
            let model:MenuItemModel = menuData[indexPath.row]
            cell.configCellWithModel(CellModel: model, UIViewController: self)
        }
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
    
    func prepareMenuData(){
        let menu = MenuItemModel()
        menu.setValuesForKeys(["name": "food", "label": "Food", "image": "food"] as [String : Any])
        let menu1 = MenuItemModel()
        menu1.setValuesForKeys(["name": "hotel", "label": "Hotel", "image": "hotel"] as [String : Any])
        let menu2 = MenuItemModel()
        menu2.setValuesForKeys(["name": "taxi", "label": "Taxi", "image": "taxi"] as [String : Any])
        let menu3 = MenuItemModel()
        menu3.setValuesForKeys(["name": "flight", "label": "Flight", "image": "flight"] as [String : Any])
        let menu4 = MenuItemModel()
        menu4.setValuesForKeys(["name": "wealth", "label": "Wealth", "image": "wealth"] as [String : Any])
        let menu5 = MenuItemModel()
        menu5.setValuesForKeys(["name": "rewards", "label": "Rewards", "image": "rewards"] as [String : Any])
        let menu6 = MenuItemModel()
        menu6.setValuesForKeys(["name": "health", "label": "Health", "image": "health"] as [String : Any])
        let menu7 = MenuItemModel()
        menu7.setValuesForKeys(["name": "edu", "label": "Edu", "image": "edu"] as [String : Any])
        
        self.menuData.append(menu)
        self.menuData.append(menu1)
        self.menuData.append(menu2)
        self.menuData.append(menu3)
        self.menuData.append(menu4)
        self.menuData.append(menu5)
        self.menuData.append(menu6)
        self.menuData.append(menu7)
    }
    
    var foodData = [FoodModel]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCellid") as! FoodCell
        //cell.delegate = self
        cell.createFoodCellWith(Section: indexPath.section, Row: indexPath.row)
        if !foodData.isEmpty {
            let model:FoodModel = foodData[indexPath.row]
            cell.configCellWithModel(CellModel: model)
        }
        cell.contentView.backgroundColor = UIColor.white
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func prepareFoodData(){
        let food = FoodModel()
        food.setValuesForKeys(["name": "Mr Pizza", "star": 4, "image": "food", "location": "沙河口区高尔基路凯德和平广场一层（2号门)", "price":"￥83/人", "category": "匹萨"] as [String : Any])
        foodData.append(food)
        
        let food1 = FoodModel()
        food1.setValuesForKeys(["name": "Mr Pizza", "star": 3, "image": "food", "location": "沙河口区高尔基路凯德和平广场一层（5号门)", "price":"￥83/人", "category": "匹萨"] as [String : Any])
        foodData.append(food1)
        
        let food2 = FoodModel()
        food2.setValuesForKeys(["name": "Mr Pizza", "star": 5, "image": "food", "location": "沙河口区高尔基路凯德和平广场一层（8号门)", "price":"￥83/人", "category": "匹萨"] as [String : Any])
        foodData.append(food2)
        
        let food3 = FoodModel()
        food3.setValuesForKeys(["name": "Mr Pizza", "star": 2, "image": "food", "location": "沙河口区高尔基路凯德和平广场一层（9号门)", "price":"￥83/人", "category": "匹萨"] as [String : Any])
        foodData.append(food3)
        
    }

}

