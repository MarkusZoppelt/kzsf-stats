//
//  ViewController.swift
//  KZ:SF Stats
//
//  Created by Markus Zoppelt on 06.09.14.
//  Copyright (c) 2014 Markus Zoppelt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
                            
    var players = [String]()
    let context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    let pic_logo = UIImage(named: "kzlogo.png")
    let kzlogo = UIImageView(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2-150, 40, 300, 75))
    let textBox = UITextField(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2-125, UIScreen.mainScreen().bounds.height/2-100, 250, 50))
    let infoLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2-200, UIScreen.mainScreen().bounds.height-150, 400, 150))
    
    func getStatsButtonClicked(sender: UIButton) {
        
        if(textBox.text == "")
        {
            textBox.textColor = UIColor.redColor()
            textBox.text = "Enter your Username!"
        }
        else
        {
            var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
            var path = paths.stringByAppendingPathComponent("data.plist")
            var user = textBox.text
            
            NSLog("contacting: http://killzone4.online.scee.com/api/profile/get-competitive/\(user)")
            let stats = JSON.fromURL("http://killzone4.online.scee.com/api/profile/get-competitive/\(user)")
            
            if(stats["Kills"].asString == nil)
            {
                textBox.textColor = UIColor.redColor()
                textBox.text = "User not found"
                textBox.resignFirstResponder()
                
            }
            else
            {
                var psnNick = textBox.text
                var fileManager = NSFileManager.defaultManager()
                if (!(fileManager.fileExistsAtPath(path)))
                {
                    var bundle : NSString = NSBundle.mainBundle().pathForResource("data", ofType: "plist")!
                    fileManager.copyItemAtPath(bundle, toPath: path, error:nil)
                }
                
                psnNick.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
                NSLog("User \(psnNick) saved")
                
                
                let svc = StatsViewController()
                self.navigationController?.pushViewController(svc, animated: true)
                
            }
        }
    }
    
    func textFieldDidChange(sender: UITextField)
    {
        textBox.textColor = UIColor.blackColor()
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        textBox.resignFirstResponder()
        return true;
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.textBox.delegate = self;
        
        view.backgroundColor = UIColor.blackColor()
        
        kzlogo.image = pic_logo
        
        infoLabel.textColor = UIColor.grayColor()
        infoLabel.textAlignment = NSTextAlignment.Center
        infoLabel.numberOfLines = 4
        infoLabel.text = "Enter your PSN-Username\n\nAttention:\ncase-sensitive!"
        
        
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = paths.stringByAppendingPathComponent("data.plist")
        
        let user:NSString = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
        
        if (user.length != 0)
        {
            NSLog("user found: \(user)")
            let svc = StatsViewController()
            self.navigationController?.pushViewController(svc, animated: true)
        }

        
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(UIScreen.mainScreen().bounds.width/2-50, UIScreen.mainScreen().bounds.height/2-50, 100, 50)
        button.backgroundColor = UIColor.whiteColor()
        button.setTitle("Login", forState: UIControlState.Normal)
        button.addTarget(self, action: "getStatsButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        button.backgroundColor = UIColor.clearColor()
        button.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        
        
        textBox.borderStyle = UITextBorderStyle.RoundedRect
        textBox.textAlignment = NSTextAlignment.Center
        textBox.backgroundColor = UIColor.cyanColor()
        textBox.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
        //REMOVE THIS
        textBox.text = "MarkusTheFanatic"
        
        view.addSubview(kzlogo)
        view.addSubview(infoLabel)
        view.addSubview(button)
        view.addSubview(textBox)
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
