//
//  ViewController.swift
//  ColorBoxSwitches
//
//  Created by snandlall on 11/16/17.
//  Copyright © 2017 snandlall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var redSwitch: UISwitch!
    var greenSwitch: UISwitch!
    var blueSwitch: UISwitch!
    var combinationSquare: UIView!
    
    //MARK: - Initialize UI
    
    //Creates the three color switches and sets them to "OFF"
    func initColorSwith(mySwitch: UISwitch!, color: UIColor, x: CGFloat, y: CGFloat)-> UISwitch {
        let mySwitch = UISwitch(frame: CGRect(x: x, y: y, width: 0, height: 0))
        mySwitch.tintColor = color
        mySwitch.onTintColor = color
        mySwitch.isOn = false
        self.view.addSubview(mySwitch)
        mySwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
        return mySwitch
    }
    
    //Create the color box that shows the comination of colors selected and sets color = All Colors "OFF"
    func initCombinationSquare(mySquare: UIView!, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)-> UIView {
        let myCombinationSquare = UIView(frame: CGRect(x: x - width/2, y: y, width: width, height: height))
        myCombinationSquare.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1) //All switches start "OFF" when program starts
        self.view.addSubview(myCombinationSquare)
        return myCombinationSquare
    }
    
    
    //Called when View Controller loads.  It calls the functions to setup UI components and passing them any necessary input
    func setupUI(){
        let centerX = self.view.frame.width / 2
        let yCoord:CGFloat = 50                   //Multiplied to generate y-coordinate for UI elements
        view.backgroundColor = UIColor.lightGray
        self.redSwitch = initColorSwith(mySwitch: redSwitch, color: UIColor.red, x: centerX, y: yCoord)
        self.greenSwitch = initColorSwith(mySwitch: greenSwitch, color: UIColor.green, x: centerX, y: yCoord * 2)
        self.blueSwitch = initColorSwith(mySwitch: blueSwitch, color: UIColor.blue, x: centerX, y: yCoord * 3)
        self.combinationSquare = initCombinationSquare(mySquare: combinationSquare, x: centerX, y: yCoord * 4, width: 200, height: 200)
    }
    
    //Sets the color of square to existing ON/OFF sequence of switches
    func setCombinationSquare(){
        let r: CGFloat = redSwitch.isOn ? 1 : 0
        let g: CGFloat = greenSwitch.isOn ? 1 : 0
        let b: CGFloat = blueSwitch.isOn ? 1 : 0
        combinationSquare.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
    }
    
    //Action that all three switches call
    @objc func switchValueDidChange(to sender: UISwitch)
    {
        sender.isOn ? print("Switch turned ON") : print("OFF")
        setCombinationSquare()
    }
    
    
    //MARK: - Overloaded Switch functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}



//MARK: - Notes

/*
 Lines 14-17 (UISwitch!) declarations
 are not needed to appear on screen & not needed to trigger action with ".addTarget"
 they are needed to give these UIElement variables scope so other functions can access.  Example the r,g,b values pulled within setCombinationSquare
 
 func setupUI programmatically setting coordinates
 frame is built-in value
 center is also built-in value but it wasn't used in this program
 */
