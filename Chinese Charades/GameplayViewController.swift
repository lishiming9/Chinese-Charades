//
//  GameplayViewController.swift
//  Chinese Charades
//
//  Created by Hao Ni on 15-3-18.
//  Copyright (c) 2015年 Hao Ni. All rights reserved.
//

import Foundation

import UIKit

class GameplayViewController: UIViewController {
    
    var logic: CalcLogic!
    
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var timeCounter: UILabel!
    
}