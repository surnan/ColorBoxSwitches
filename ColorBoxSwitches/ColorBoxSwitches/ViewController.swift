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
    
    
    func initEverything(){
        view.backgroundColor = UIColor.lightGray
        redSwitch = UISwitch()
        greenSwitch = UISwitch()
        blueSwitch = UISwitch()
        
        redSwitch = UISwitch(frame: CGRect(x: 150, y: 50, width: 0, height: 0))
        greenSwitch = UISwitch(frame: CGRect(x: 150, y: 100, width: 0, height: 0))
        blueSwitch = UISwitch(frame: CGRect(x: 150, y: 150, width: 0, height: 0))
        
        redSwitch.tintColor = UIColor.red
        redSwitch.onTintColor = UIColor.red
        greenSwitch.tintColor = UIColor.green
        greenSwitch.onTintColor = UIColor.green
        blueSwitch.tintColor = UIColor.blue
        blueSwitch.onTintColor = UIColor.blue
        
        
        redSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
        greenSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
        blueSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)

        
        self.view.addSubview(redSwitch)
        self.view.addSubview(greenSwitch)
        self.view.addSubview(blueSwitch)

        
        
    }
  
    
    
    @objc func switchValueDidChange(to sender: UISwitch)
    {
        if sender.isOn {
            print("Switch turned ON")
        } else {
            print("OFF")
        }
    }
    
    
    
//    @objc func sliderValueDidChange(to value: UISwitch)
//    {
//        print("value--")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initEverything()
    }

    
    
    
    
    
    

}

