//
//  GameplayViewController.swift
//  Chinese Charades
//
//  Created by Hao Ni on 15-3-18.
//  Copyright (c) 2015年 Hao Ni. All rights reserved.
//

import Foundation

import UIKit
import 	CoreMotion
var secondsLeft:Int!;

class GameplayViewController: UIViewController {
    
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    var timer: NSTimer!
    
    var cmmotion :CMMotionManager!
    var gyroData :CMGyroData!
    override func viewDidLoad() {
        startCountdown()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myCounterLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBAction func restartGame(sender: AnyObject) {
        if(timer.valid == false){
            startCountdown()
        }
    }
    
    func startCountdown(){
        secondsLeft = 10;
        myCounterLabel.text = "\(secondsLeft)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateCounter", userInfo: nil, repeats: true)
        restartButton.hidden = true;
        cmmotion.startGyroUpdates()
        gyroData = cmmotion.gyroData
    }
    
    
    func updateCounter() {
        if(secondsLeft > 0 ){
            secondsLeft = secondsLeft - 1
            myCounterLabel.text = "\(secondsLeft)"
        }
        else{
            timer.invalidate()
            restartButton.hidden = false;
        }
    }
    
    
    @IBOutlet weak var wordLabel: UILabel!
    
    
    
    
    
}