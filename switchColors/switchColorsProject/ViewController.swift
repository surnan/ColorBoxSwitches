//
//  ViewController.swift
//  switchColorsProject
//
//  Created by admin on 12/26/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var nightModeButton = UIButton()
    var totalStack = UIStackView()
    var colorBox = UIView()
    var sizeModeLabel = UILabel()
    
    var colorSwitches = [UISwitch]()
    
    fileprivate var regularContraints = [NSLayoutConstraint]()
    fileprivate var compactContraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        totalStack = setupSwitchStacks()
        nightModeButton = setupNightModeButton()
        colorBox = setupColorBox()
        sizeModeLabel = setupSizeModeLabel()
        
        allTranslatesAutoresizingMasks(); allSubViewsAdded()
        
        let nightModeButtonXCenter = nightModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let nightModeButtonTop = nightModeButton.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor, constant: 50)
        let totalStackXCenter = totalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let totalStackYCenter = totalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        let colorBoxYCenter = colorBox.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let colorBoxWidth = colorBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.66)
        let colorBoxTop = colorBox.topAnchor.constraint(equalTo: totalStack.bottomAnchor , constant: 50)
        let colorBoxBtm = colorBox.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        
        NSLayoutConstraint.activate([
            nightModeButtonXCenter, nightModeButtonTop,
            totalStackXCenter, totalStackYCenter,
            colorBoxYCenter, colorBoxWidth, colorBoxBtm, colorBoxTop
            ])
        
        regularContraints.append(sizeModeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        regularContraints.append(sizeModeLabel.topAnchor.constraint(equalTo: nightModeButton.bottomAnchor, constant: 30))
        compactContraints.append(sizeModeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        compactContraints.append(sizeModeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.horizontalSizeClass == .regular {
            totalStack.axis = .horizontal
            NSLayoutConstraint.activate(compactContraints)
            NSLayoutConstraint.deactivate(regularContraints)
            sizeModeLabel.text = "Class Size = REGULAR"
        } else {
            totalStack.axis = .vertical
            NSLayoutConstraint.deactivate(compactContraints)
            NSLayoutConstraint.activate(regularContraints)
            sizeModeLabel.text = "Class Size = COMPACT"
        }
    }
    
    @objc func clickMe(sender: UIButton!){
      for temp in view.allSubViews {
            if let btn = temp as? UIButton {
                if btn.backgroundColor == .red {
                    btn.backgroundColor = .black
                    btn.setTitle("Night Mode", for: .normal)
                    btn.setTitleColor(UIColor.white, for: .normal)
                    view.backgroundColor = .white
                } else {
                    btn.backgroundColor = .red
                    btn.setTitle("Day Mode", for: .normal)
                    btn.setTitleColor(UIColor.black, for: .normal)
                    view.backgroundColor = .black
                }
            }
        }
    }
    
    func setupSizeModeLabel() -> UILabel{
        let temp = UILabel()
        temp.text = "hello world"
        temp.textColor = UIColor.purple
        temp.font = UIFont(name: "COPPERPLATE-BOLD", size: 30)
        return temp
    }
    
    
    func setupColorBox() -> UIView {
        let temp = UIView()
        temp.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        
        temp.layer.borderWidth = 5
        temp.layer.borderColor = UIColor.black.cgColor
        //        temp.layer.borderColor = UIColor(displayP3Red: 255, green: 153, blue: 255, alpha: 1).cgColor  //Another valid way to set CGColor
        return temp
    }
    
    func setupSwitchStacks() -> UIStackView {
        let row1 = colorRowStack(name: "RED")
        let row2 = colorRowStack(name: "GREEN")
        let row3 = colorRowStack(name: "BLUE")
        let tempStack1 = makeStack(axis: .horizontal, spacing: 20, elements: row1.rLabel, row1.rSwitch)
        let tempStack2 = makeStack(axis: .horizontal, spacing: 20, elements: row2.rLabel, row2.rSwitch)
        let tempStack3 = makeStack(axis: .horizontal, spacing: 20, elements: row3.rLabel, row3.rSwitch)
        let returnStack = makeStack(axis: .horizontal, spacing: 20, elements: tempStack1, tempStack2, tempStack3)
        
        colorSwitches.append(row1.rSwitch)
        colorSwitches.append(row2.rSwitch)
        colorSwitches.append(row3.rSwitch)
        
        
        //        row1.rSwitch.addTarget(self, action: #selector(switchTriggered), for: .valueChanged)  //Another valid way
        
        colorSwitches[0].addTarget(self, action: #selector(switchTriggered), for: .valueChanged)
        colorSwitches[1].addTarget(self, action: #selector(switchTriggered), for: .valueChanged)
        colorSwitches[2].addTarget(self, action: #selector(switchTriggered), for: .valueChanged)
        
        return returnStack
        
    }
    
    
    @objc func switchTriggered(sender: UISwitch!){
        
        let oldColors = colorBox.backgroundColor?.rgb()
        let state = sender.isOn ? CGFloat(1) : CGFloat(0)
        
        print("\n\n")
        switch sender!.tintColor! {
        case UIColor.red:colorBox.backgroundColor = UIColor(displayP3Red: state, green: (oldColors?.green)!, blue: (oldColors?.blue)!, alpha: 1)
        case UIColor.green:colorBox.backgroundColor = UIColor(displayP3Red: (oldColors?.red)!, green: state, blue: (oldColors?.blue)!, alpha: 1)
        case UIColor.blue:colorBox.backgroundColor = UIColor(displayP3Red: (oldColors?.red)!, green: (oldColors?.green)!, blue: state, alpha: 1)
        default:
            print("!!!something bad happened!!!")
        }
    }
    
    func setupNightModeButton() -> UIButton {
        let temp = UIButton()
        temp.setTitle("Night Mode", for: .normal)
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.backgroundColor = UIColor.lightGray
        temp.addTarget(self, action: #selector(clickMe), for: UIControlEvents.touchUpInside)
        return temp
    }
    
    func allTranslatesAutoresizingMasks(){
        nightModeButton.translatesAutoresizingMaskIntoConstraints = false
        totalStack.translatesAutoresizingMaskIntoConstraints = false
        colorBox.translatesAutoresizingMaskIntoConstraints = false
        sizeModeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func allSubViewsAdded(){
        view.addSubview(nightModeButton)
        view.addSubview(totalStack)
        view.addSubview(colorBox)
        view.addSubview(sizeModeLabel)
    }
}

//////////////////////////////
//////////////////////////////
extension UIView {
    var allSubViews: [UIView] {
        var array = [self.subviews].flatMap {$0}
        array.forEach { array.append(contentsOf: $0.allSubViews)}
        return array
    }
}
