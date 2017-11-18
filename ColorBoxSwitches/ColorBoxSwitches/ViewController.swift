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

    func setupUI(){
        view.backgroundColor = UIColor.lightGray

        let redSwitch = UISwitch(frame: CGRect(x: 150, y: 50, width: 0, height: 0))
        redSwitch.tintColor = UIColor.red
        redSwitch.onTintColor = UIColor.red
        redSwitch.isOn = false
        self.view.addSubview(redSwitch)
        self.redSwitch = redSwitch
        redSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
  
        let greenSwitch = UISwitch(frame: CGRect(x: 150, y: 100, width: 0, height: 0))
        greenSwitch.tintColor = UIColor.green
        greenSwitch.onTintColor = UIColor.green
        greenSwitch.isOn = false
        self.view.addSubview(greenSwitch)
        self.greenSwitch = greenSwitch
        greenSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)

        let blueSwitch = UISwitch(frame: CGRect(x: 150, y: 150, width: 0, height: 0))
        blueSwitch.tintColor = UIColor.blue
        blueSwitch.onTintColor = UIColor.blue
        blueSwitch.isOn = false
        self.view.addSubview(blueSwitch)
        self.blueSwitch = blueSwitch
        blueSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)

        let combinationSquare = UIView(frame: CGRect(x: 100, y: 250, width: 200, height: 200))
        combinationSquare.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        self.combinationSquare = combinationSquare
        self.view.addSubview(combinationSquare)
    }
    
    func setCombinationSquare(){
        
        let r: CGFloat = redSwitch.isOn ? 1 : 0
        let g: CGFloat = greenSwitch.isOn ? 1 : 0
        let b: CGFloat = blueSwitch.isOn ? 1 : 0
        combinationSquare.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
    }
    
    @objc func switchValueDidChange(to sender: UISwitch)
    {
        sender.isOn ? print("Switch turned ON") : print("OFF")
        setCombinationSquare()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

