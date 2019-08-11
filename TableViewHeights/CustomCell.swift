//
//  CustomCell.swift
//  TableViewHeights
//
//  Created by Lexon on 27/7/2019.
//  Copyright © 2019 waybu. All rights reserved.
//

import Foundation
import UIKit

class UIExtendButton: UIButton {
    
    func setProperties() {
        backgroundColor = #colorLiteral(red: 1, green: 0.8876056746, blue: 0.5669729069, alpha: 1)
        layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setProperties()
    }
}

class CustomCell: UITableViewCell {
    
    
    func loadDataFrom() {
        let name: String = "Some Deckle"
        let startTime: String = "23:59"
        let deck: String = "Some Deck"
        
        setTaskName(withName: name)
        setStartTime(withStartTime: startTime)
        setDeck(withDeck: deck)
        
    }
    
    func setTaskName(withName name: String) {
        let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        taskLabel.attributedText = attributedText
    }
    
    func setStartTime(withStartTime time: String) {
        let attributedText = NSMutableAttributedString(string: time, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        startTimeLabel.attributedText = attributedText
    }
    
    func setDeck(withDeck deck: String) {
        deckLabel.text = deck
    }
    
    

    //MARK: UI Implementation
    
    //MARK: Bottom Stack View
    
    let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 30.0
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let extendLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Extend by: ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)])
        label.attributedText = attributedText
        label.numberOfLines = 2
        return label
    }()

    let fiveButton: UIExtendButton = {
        let extendButton = UIExtendButton()
        extendButton.setTitle("5 mins", for: .normal)
        
        return extendButton
    }()
    
    let fifteenButton: UIExtendButton = {
        let extendButton = UIExtendButton()
        extendButton.setTitle("15 mins", for: .normal)
        
        return extendButton
    }()
    
    //MARK: Top View
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let boxView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.9215686275, blue: 0.6431372549, alpha: 1)
        view.layer.cornerRadius = 20
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let boxStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 1.0
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        let attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        label.attributedText = attributedText
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deckLabel: UILabel = {
        let label = UILabel()
        label.text = "Misc"
        label.textColor = .darkGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Constants.color
        button.layer.cornerRadius = 20
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Progress View
    
    let progressView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let progressBar: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let progressCircle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        
        view.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.9215686275, blue: 0.6431372549, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Time View
    
    let timeView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let startTimeLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "00:00", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        label.attributedText = attributedText
        label.textAlignment = .center
        label.textColor = .darkGray
        label.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.9215686275, blue: 0.6431372549, alpha: 1)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    //RUN this first!
    func setupTimeViewLayout() {
        contentView.addSubview(timeView)
        
        timeView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        timeView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        timeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        timeView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        //adding startTimeLabel
        timeView.addSubview(startTimeLabel)
        
        startTimeLabel.centerXAnchor.constraint(equalTo: timeView.centerXAnchor).isActive = true
        startTimeLabel.topAnchor.constraint(equalTo: timeView.topAnchor).isActive = true
        startTimeLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        startTimeLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
    }
    
    //RUN this second!
    func setupProgressViewLayout() {
        contentView.addSubview(progressView)
        
        progressView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        progressView.leftAnchor.constraint(equalTo: timeView.rightAnchor).isActive = true
        
        //progress circle
        progressView.addSubview(progressCircle)
        progressCircle.topAnchor.constraint(equalTo: progressView.topAnchor).isActive = true
        progressCircle.centerXAnchor.constraint(equalTo: progressView.centerXAnchor).isActive = true
        progressCircle.widthAnchor.constraint(equalToConstant: 15).isActive = true
        progressCircle.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        //progress bar
        progressView.addSubview(progressBar)
        progressBar.widthAnchor.constraint(equalToConstant: 2).isActive = true
        progressBar.topAnchor.constraint(equalTo: progressCircle.bottomAnchor).isActive = true
        progressBar.bottomAnchor.constraint(equalTo: progressView.bottomAnchor).isActive = true
        progressBar.centerXAnchor.constraint(equalTo: progressView.centerXAnchor).isActive = true
        
    }
    
    func setupStatusViewLayout() {
        topView.addSubview(statusButton)
        
        statusButton.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -3).isActive = true
        statusButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 3).isActive = true
        statusButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -3).isActive = true
        statusButton.widthAnchor.constraint(equalTo: statusButton.heightAnchor).isActive = true

    }
    
    //HAS TO BE RUN AFTER STATUS VIEW!
    func setupBoxViewLayout() {
        topView.addSubview(boxView)
        
        boxView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 3).isActive = true
        boxView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -3).isActive = true
        boxView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 8).isActive = true
        boxView.rightAnchor.constraint(equalTo: statusButton.leftAnchor, constant: -8).isActive = true
        
        //setup box stack view
        boxView.addSubview(boxStackView)
        boxStackView.leftAnchor.constraint(equalTo: boxView.leftAnchor, constant: 8).isActive = true
        boxStackView.rightAnchor.constraint(equalTo: boxView.rightAnchor, constant: -8).isActive = true
        boxStackView.topAnchor.constraint(equalTo: boxView.topAnchor, constant: 3).isActive = true
        boxStackView.bottomAnchor.constraint(equalTo: boxView.bottomAnchor, constant: -3).isActive = true
        
        //setup box stack view
        boxStackView.addArrangedSubview(taskLabel)
        boxStackView.addArrangedSubview(deckLabel)
        
    }
    
    
    func setupTopViewLayout(withHeight height: CGFloat) {
        contentView.addSubview(topView)
        
        topView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: height).isActive = true
        topView.leftAnchor.constraint(equalTo: progressView.rightAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    /**
     Setup the stack view with the buttons when cell is expanded
    - Parameter height: The height of the stack view
    */
    func setupBottomStackViewLayout(withHeight height: CGFloat) {
        contentView.addSubview(bottomStackView)
        
        bottomStackView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        bottomStackView.leftAnchor.constraint(equalTo: progressView.rightAnchor, constant: 8).isActive = true
        bottomStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        bottomStackView.isHidden = true
        
        //add extend label and buttons to stack view
        bottomStackView.addArrangedSubview(extendLabel)
        bottomStackView.addArrangedSubview(fiveButton)
        bottomStackView.addArrangedSubview(fifteenButton)

    }
    
    /**
     Sets up the cell with constraints and positioning, please note that the order of these method calls are non-trivial
     - Parameter height: height of a single cell
     - Parameter expandedHeight: height of single cell when tapped and expanded
     */
    init(withCellheight height: CGFloat, withExpandedHeightOfCell expandedHeight: CGFloat) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        setupTimeViewLayout()
        setupProgressViewLayout()
        setupTopViewLayout(withHeight: height)
        setupStatusViewLayout()
        setupBoxViewLayout()
        setupBottomStackViewLayout(withHeight: expandedHeight - height)
        
        loadDataFrom()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
