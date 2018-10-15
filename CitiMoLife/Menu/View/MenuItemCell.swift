//
//  MenuItemCell.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/3.
//  Copyright © 2018年 tiny. All rights reserved.
//

import Foundation
import UIKit


class MenuItemCell: UICollectionViewCell {
    
    let button = UIButton(frame:CGRect(x:0, y:0, width: SCREEN_WIDTH/4, height: SCREEN_WIDTH/4))
    
    var mainViewContorller:UIViewController?
    
    
    func createMenuItemCellWith(Section section:NSInteger, Row row:NSInteger){
        
        button.layoutIfNeeded()
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = UIColor.white
        button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 22.5, bottom: 30, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -42.5, bottom: -60, right: 10)
        button.tag = row
        self.contentView.addSubview(button)
    }
    
    func configCellWithModel(CellModel cellModel: MenuItemModel, UIViewController main: UIViewController){
        button.setTitle(cellModel.label, for: .normal)
        button.setImage(UIImage(named:cellModel.image), for: .normal)
        button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        mainViewContorller = main
    }
    
    @objc func buttonClick(button:UIButton){
        button.isSelected = !button.isSelected
        if button.currentTitle == "Flight" {
            let viewController = FlightViewController()
            mainViewContorller?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}
