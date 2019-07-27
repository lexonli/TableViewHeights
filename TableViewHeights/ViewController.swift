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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return selectedIndex == indexPath.row ? 200 : 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = selectedIndex == indexPath.row ? nil : indexPath.row
        
        tableView.beginUpdates()
        if let cell = tableView.cellForRow(at: indexPath) as? CustomCell {
            UIView.animate(withDuration: 0.15) {
                //hide the button if the cell is not selected
                cell.cellButton.isHidden = self.selectedIndex == indexPath.row ? false : true
                cell.cellLabel.text = self.selectedIndex == indexPath.row ? "OMG Im so big, tap me again!" : "Row: \(indexPath.row) touch me to expand"
                
            }
        }
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomCell(title: "Row: \(indexPath.row) touch me to expand")
        //        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
//        cell.textLabel?.text = "Row: \(indexPath.row) touch me to expand"
        cell.selectionStyle = .none
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
    }


}

