//
//  ViewController.swift
//  CustomFont
//
//  Created by hussein albazaz on 6/2/16.
//  Copyright © 2016 hussein. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    enum Operation: String
    {
        case Add = "+"
        case Multiply = "*"
        case Divide = "/"
        case Subtract = "-"
        case Equals = "="
        case Empty = "Empty"
        
    }

    var LeftString = ""
    var RightString = ""
    var num = ""
    var currentOPeration: Operation = Operation.Empty
    @IBOutlet weak var outputLabel: UILabel!
    var btnSound: AVAudioPlayer!
    
    
    
    
    @IBAction func buttonPressed(btn: UIButton)
    {
    playSound()
    num += "\(btn.tag)"
    outputLabel.text = num
    
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do{
         try   btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay() // get it ready for the user to use it so there is no wait time
        }catch let err as NSError
        {
        print(err.debugDescription)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        ProcessOPeration(Operation.Divide)
    }
    
    @IBAction func onMultipyPressed(sender: AnyObject) {
        ProcessOPeration(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        ProcessOPeration(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        ProcessOPeration(Operation.Add)
    }

    @IBAction func onEqualsPressed(sender: AnyObject) {
        ProcessOPeration(Operation.Equals)
    }
    
    func playSound()
    {
        if(btnSound.playing)
        {
            btnSound.stop()
            btnSound.currentTime = 0
        }
        btnSound.play()
        
    }
    
    func ProcessOPeration(op: Operation)
    {
    playSound()
        
        if currentOPeration != Operation.Empty
        {
        // do some math
            
                RightString = num
            num = ""
            
            
                        if(op == Operation.Equals)
            {
                
                doOPeration()
                outputLabel.text = LeftString
                currentOPeration=Operation.Empty
            }
            else
                        {
                            doOPeration()
                            currentOPeration = op
            }




        
        }
        else{
            if !num.isEmpty {
                LeftString = num}
        num = ""
        currentOPeration = op
        }
    
    }
    
    func doOPeration()
    {
        if(currentOPeration == Operation.Add)
        {
            if RightString.isEmpty
            {
                RightString = "\(0)"
            }
            LeftString = "\(Double(LeftString)! + Double(RightString)!)"
            outputLabel.text = LeftString
        }
        if(currentOPeration == Operation.Subtract)
        {
            if RightString.isEmpty
            {
                RightString = "\(0)"
            }
            LeftString = "\(Double(LeftString)! - Double(RightString)!)"
            outputLabel.text = LeftString
        }
        if(currentOPeration == Operation.Multiply)
        {
            if RightString.isEmpty
            {
                RightString = "\(1)"
            }
            LeftString = "\(Double(LeftString)! * Double(RightString)!)"
            outputLabel.text = LeftString
        }
        if(currentOPeration == Operation.Divide)
        {
            if RightString.isEmpty
            {
                RightString = "\(1)"
            }
            LeftString = "\(Double(LeftString)! / Double(RightString)!)"
            outputLabel.text = LeftString
        }

    }
    
    
    

}

