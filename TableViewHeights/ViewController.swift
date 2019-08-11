//
//  ViewController.swift
//  TableViewHeights
//
//  Created by Wayne Buchner on 27/7/19.
//  Copyright © 2019 waybu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// You can use this simple to toggle between selected or unselected
    var selectedIndex: Int?
    
    let cellHeight: CGFloat = 80
    let expandedCellHeight: CGFloat = 140
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return selectedIndex == indexPath.row ? expandedCellHeight : cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = selectedIndex == indexPath.row ? nil : indexPath.row

        UIView.transition(with: tableView,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() })
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomCell(withCellheight: cellHeight, withExpandedHeightOfCell: expandedCellHeight)
        cell.selectionStyle = .none
        cell.bottomStackView.isHidden = self.selectedIndex == indexPath.row ? false : true
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        tableView.separatorColor = .white
    }


}

