//
//  FoodCell.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/8.
//  Copyright © 2018年 tiny. All rights reserved.
//

import UIKit

let IMAGE_WIDTH:CGFloat = 50.0
let IMAGE_HEIGHT:CGFloat  = 60.0
let TEXT_SPACE:CGFloat = 20.0
let titleWidth:CGFloat = SCREEN_WIDTH - IMAGE_WIDTH - TEXT_SPACE

class FoodCell: UITableViewCell {
 
    var foodName:UILabel?
    var priceLable:UILabel?
    var location:UILabel?
    var stars:UIImageView?
    var category:UILabel?
    var foodImage:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func createFoodCellWith(Section section:NSInteger, Row row:NSInteger){
        
        
        
        foodImage = UIImageView()
        let url = URL(string: "http://p1.meituan.net/mogu/8e861f0ec409a4b7088edd0e6de2d8be98884.jpg@40w_40h_2e_1c")
        let data = try! Data(contentsOf: url!)
        let newImage = UIImage(data: data)
        foodImage?.image = newImage
        //foodImage?.image = UIImage(named:"pizza")
        foodImage?.contentMode = UIView.ContentMode.scaleAspectFit
        foodImage?.frame = CGRect.init(x: 5, y: 5, width: IMAGE_WIDTH, height: IMAGE_HEIGHT);
        self.contentView.addSubview(foodImage!)
        

        foodName = Util.createLabelWith(Text: "", Frame: CGRect(x:IMAGE_WIDTH + TEXT_SPACE, y:5.0, width:titleWidth, height:20.0), TextColor: UIColor.black, Font: 15.0, TextAligtment: .left)
        self.contentView.addSubview(foodName!)
        
//        stars = UIImageView()
//        stars?.image = UIImage(named:"star")
//        stars?.contentMode = UIView.ContentMode.scaleAspectFit
//        stars?.frame = CGRect.init(x: IMAGE_WIDTH + TEXT_SPACE, y: 25.0, width: 16, height: 20.0);
//        self.contentView.addSubview(stars!)
        
//        priceLable = Util.createLabelWith(Text: "", Frame: CGRect(x:IMAGE_WIDTH + TEXT_SPACE + 16.0, y:25.0, width:titleWidth, height:20.0), TextColor: UIColor.gray, Font: 12.0, TextAligtment: .left)
//        self.contentView.addSubview(priceLable!)
        
        location = Util.createLabelWith(Text: "", Frame: CGRect(x:IMAGE_WIDTH + TEXT_SPACE, y:45.0, width:titleWidth, height:20.0), TextColor: UIColor.gray, Font: 12.0, TextAligtment: .left)
        self.contentView.addSubview(location!)
    }
    
    func configCellWithModel(CellModel cellModel: FoodModel){
        
        foodName?.text = cellModel.name
        
        //priceLable?.text = cellModel.price
        
        location?.text = cellModel.location
        
        let starLength = CGFloat(16 * cellModel.star)
        for i in 1...cellModel.star {
            let star = UIImageView()
            let deviation = CGFloat((i - 1) * 16)
            star.image = UIImage(named:"star")
            star.contentMode = UIView.ContentMode.scaleAspectFit
            star.frame = CGRect.init(x: IMAGE_WIDTH + TEXT_SPACE + deviation, y: 25.0, width: 16, height: 20.0);
            self.contentView.addSubview(star)
        }
        
        priceLable = Util.createLabelWith(Text: cellModel.price, Frame: CGRect(x:IMAGE_WIDTH + TEXT_SPACE + starLength + TEXT_SPACE, y:25.0, width:titleWidth, height:20.0), TextColor: UIColor.gray, Font: 12.0, TextAligtment: .left)
        self.contentView.addSubview(priceLable!)
    }
    

}
