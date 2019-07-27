//
//  CustomCell.swift
//  TableViewHeights
//
//  Created by Lexon on 27/7/2019.
//  Copyright © 2019 waybu. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    var cellButton: UIButton!
    var cellLabel: UILabel!
    
    init(title: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        cellLabel = UILabel(frame: CGRect(x: 5, y: 5, width: 400, height: 40))
        cellLabel.textColor = UIColor.black
        cellLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cellLabel.text = title
        
        //position the cellButton under the cellLabel
        cellButton = UIButton(frame: CGRect(x: 5, y: 50, width: 400, height: 40))
        cellButton.setTitle("Button that does nothing", for: .normal)
        cellButton.backgroundColor = .blue
        cellButton.isHidden = true
        
        addSubview(cellLabel)
        addSubview(cellButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
