//
//  HotCityCell.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/13.
//  Copyright © 2018年 tiny. All rights reserved.
//

import Foundation
import UIKit
class HotCityCell:UITableViewCell {
    
    var name:UILabel?
    var cityDescription:UILabel?
    var cityImage:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)  
    }
    
    func configCellWithModel(CellModel cellModel: CityModel){
        cityImage = UIImageView()
        let url = URL(string: cellModel.imageURL)
        let data = try! Data(contentsOf: url!)
        let newImage = UIImage(data: data)
        cityImage?.image = newImage
        //cityImage?.contentMode = UIView.ContentMode.scaleAspectFit
        cityImage?.frame = CGRect.init(x: 10, y: 5, width: 60, height: 60);
        self.contentView.addSubview(cityImage!)
        
        name = Util.createLabelWith(Text: cellModel.name, Frame: CGRect(x:85, y:10, width:SCREEN_WIDTH-110, height:20), TextColor: UIColor.black, Font: 15.0, TextAligtment: .left)
        name?.font = UIFont.boldSystemFont(ofSize: 15)
        self.contentView.addSubview(name!)
        
        cityDescription = Util.createLabelWith(Text: cellModel.cityDescription, Frame: CGRect(x:85, y:35, width:SCREEN_WIDTH-110, height:20), TextColor: UIColor.black, Font: 12.0, TextAligtment: .left)
        cityDescription?.textColor = UIColor.gray;
        self.contentView.addSubview(cityDescription!)
    
    }
    
}
