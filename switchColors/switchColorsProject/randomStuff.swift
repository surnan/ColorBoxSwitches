//
//  randomStuff.swift
//  switchColorsProject
//
//  Created by admin on 12/27/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

//func makeStack(axis: UILayoutConstraintAxis, spacing: CGFloat, elements: UIView...) -> UIStackView {

func makeStack(axis: UILayoutConstraintAxis, spacing: CGFloat, elements: UIView...) -> UIStackView {
    let tempStack = UIStackView()
    
    tempStack.spacing = spacing
    tempStack.axis = axis
    
    for element in elements {
        tempStack.addArrangedSubview(element)
    }
    return tempStack
}

struct colorRowStack {
    var rLabel = UILabel()
    var rSwitch = UISwitch()
    
    init(name: String) {
        self.rLabel.text = name
        self.rLabel.textColor = myColors[name]
        self.rLabel.textAlignment = .right
        self.rSwitch.tintColor = myColors[name]
        self.rSwitch.onTintColor = myColors[name]
    }
}

let myColors: [String: UIColor] = [
    "RED": UIColor.red,
    "GREEN": UIColor.green,
    "BLUE": UIColor.blue
]



//This extension returns the Red, Green, Blue values of UIColor
extension UIColor {
    func rgb() -> (red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat)? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0); let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0); let iAlpha = Int(fAlpha * 255.0)
            
/*
    Converted to Int and then back to CGFloat because repeatedly calling this function would create rounding errors that would start
    as non-factors and then increase until they were large enough to alter the R,G,B intended values from adjusting UISwitch settings
*/
            return (red:CGFloat(iRed), green:CGFloat(iGreen), CGFloat(iBlue), alpha:CGFloat(iAlpha))
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}

