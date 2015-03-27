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
var cardno = 0
class GameplayViewController: UIViewController {
    let sourceFilePath = "word"
    var timer: NSTimer!
    var cmmotion :CMMotionManager!
    var referenceAttitude :CMAttitude!
    var up = 0, down = 0, preroll:Double!
    var list: [NSString]!
    override func viewDidLoad() {
        cmmotion = CMMotionManager();
        cmmotion.deviceMotionUpdateInterval = 0.2
        
        var encode:NSStringEncoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
        
        let bundle = NSBundle.mainBundle()
        let myFilePath = bundle.pathForResource("data_apt", ofType: "txt")
        
        
        var wordstr:NSString = NSString(contentsOfFile: myFilePath!, encoding: NSUTF8StringEncoding,error: nil)!
        
        list = wordstr.componentsSeparatedByString("\n") as [NSString]
        list = shuffle(list)
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
        up = 0; down = 0; cardno = 0; preroll = nil
        upLabel.text = "0"
        downLabel.text = "0"
        list = shuffle(list)
        startCountdown()
    }
    
    func startCountdown(){
        self.wordLabel.text = list[cardno++]
        secondsLeft = 10
        myCounterLabel.text = "\(secondsLeft)"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateCounter", userInfo: nil, repeats: true)
        restartButton.hidden = true;
        cmmotion.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: { (cmmotion:CMDeviceMotion!, error :NSError!) -> Void in
            
            if(self.preroll == nil){
                self.preroll = cmmotion.attitude.roll
            }
            else if(self.preroll < -0.8 && cmmotion.attitude.roll > -0.8){
                self.up++; self.upLabel.text = "\(self.up)";
                self.wordLabel.text = self.list[cardno++]
            }else if(self.preroll > -2.2 && cmmotion.attitude.roll < -2.2){
                self.down++; self.downLabel.text = "\(self.down)";
                self.wordLabel.text = self.list[cardno++]
            }
            self.preroll = cmmotion.attitude.roll
        })
    }
    
    
    func shuffle<C: MutableCollectionType where C.Index == Int>(var list: C) -> C {
        let count = countElements(list)
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }

    
    func updateCounter() {
        if(secondsLeft > 0 ){
            secondsLeft = secondsLeft - 1
            myCounterLabel.text = "\(secondsLeft)"
        }
        else{
            timer.invalidate()
            restartButton.hidden = false
            cmmotion.stopDeviceMotionUpdates()
        }
    }
    
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var upLabel: UILabel!
    @IBOutlet weak var downLabel: UILabel!
    
    
    
    
    
}