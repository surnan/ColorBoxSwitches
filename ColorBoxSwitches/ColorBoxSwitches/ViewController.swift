//
//  ViewController.swift
//  ColorBoxSwitches
//
//  Created by snandlall on 11/16/17.
//  Copyright © 2017 snandlall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let redSwitch = UISwitch(frame: CGRect(x: 150, y: 50, width: 0, height: 0))
    let greenSwitch = UISwitch(frame: CGRect(x: 150, y: 100, width: 0, height: 0))
    let blueSwitch = UISwitch(frame: CGRect(x: 150, y: 150, width: 0, height: 0))
    let combinationSquare = UIView(frame: CGRect(x: 100, y: 250, width: 200, height: 200))

    
    func setupUI(){
        view.backgroundColor = UIColor.lightGray
       
        redSwitch.tintColor = UIColor.red
        redSwitch.onTintColor = UIColor.red
        redSwitch.isOn = false
        self.view.addSubview(redSwitch)
        redSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
  
        greenSwitch.tintColor = UIColor.green
        greenSwitch.onTintColor = UIColor.green
        greenSwitch.isOn = false
        self.view.addSubview(greenSwitch)
        greenSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)

        blueSwitch.tintColor = UIColor.blue
        blueSwitch.onTintColor = UIColor.blue
        blueSwitch.isOn = false
        self.view.addSubview(blueSwitch)
        blueSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)

        combinationSquare.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
      //  self.combinationSquare = combinationSquare
        self.view.addSubview(combinationSquare)
    }
    
    func setCombinationSquare(){
 //       self.redSwitch.isOn = true
//        combinationSquare.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
    // willset & didset
        
    }
    
    @objc func switchValueDidChange(to sender: UISwitch)
    {
        sender.isOn ? print("Switch turned ON") : print("OFF")
//        setCombinationSquare() <-- switch initializes with nil.  First value isn't assigned till AFTER we return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

