//
//  Constants.swift
//  Deckle
//
//  Created by Lexon on 1/7/2019.
//  Copyright © 2019 Lexon Corp. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class Constants {
    //the size of the loading box
    static let boxSize = CGSize(width: 100, height: 100)
    //the theme color of the whole app
    static let color = UIColor(red:0.09, green:0.73, blue:0.40, alpha:1.0)
    //background color
    static let backgroundColor = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1.0)
    //the height of a single task table view in TaskView
    static let heightOfSingleTableView = UIScreen.main.bounds.height/6 + 20
    //number of days to display before and after today
    static let days = 365
    //start date of events and deckles we care about
    static var start: Date {
        return Calendar.current.date(byAdding: .day, value: -days, to: Date())!
    }
    //end date of events and deckles we care about
    static var end: Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
}
