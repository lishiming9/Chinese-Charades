//
//  ViewController.swift
//  Chinese Charades
//
//  Created by Hao Ni on 15-3-17.
//  Copyright (c) 2015年 Hao Ni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func supportedInterfaceOrientations() -> Int {
            return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var titalLable: UILabel!

    
    @IBAction func gameStart(sender: AnyObject) {
        var btn :UIButton = sender as UIButton
        titalLable.text = "全民"
    }
    
}

