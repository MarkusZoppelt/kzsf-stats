//
//  StatsViewController.swift
//  KZ:SF Stats
//
//  Created by Markus Zoppelt on 06.09.14.
//  Copyright (c) 2014 Markus Zoppelt. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController
{
    let scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
    let logoutButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    
    
    // EPIC LIST OF PICTURES
    let iv_profile = UIImageView(frame: CGRectMake(10, 0*165+50, 150, 150))
    let iv_tier = UIImageView(frame: CGRectMake(10, 0*165+50, 150, 150))
    let iv_kd = UIImageView(frame: CGRectMake(10, 1*165+50, 150, 150))
    let iv_overall = UIImageView(frame: CGRectMake(10, 2*165+50, 150, 150))
    
    
    
    
    
    // EPIC LIST OF STAT-LABELS
    
    let userLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 0*165+40, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let killLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165+100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let deathLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165+130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let kdLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165+160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let winssLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 40, UIScreen.mainScreen().bounds.width/2-30, 50))
    let lossesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 70, UIScreen.mainScreen().bounds.width/2-30, 50))
    let wlLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let pointsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let challengesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        
        
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = paths.stringByAppendingPathComponent("data.plist")
        var user = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
        let stats = JSON.fromURL("http://killzone4.online.scee.com/api/profile/get-competitive/\(user)")
        
        if(stats["Kills"].asString == nil)
        {
            logout(logoutButton)
        }
        else
        {
            var kills = NSString(string: stats["Kills"].asString!).doubleValue
            var deaths = NSString(string: stats["Deaths"].asString!).doubleValue
            
            
            logoutButton.frame = CGRectMake(0, 0, 75, 50)
            logoutButton.backgroundColor=UIColor.clearColor()
            logoutButton.setTitle("Logout", forState: UIControlState.Normal)
            logoutButton.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
            logoutButton.addTarget(self, action: "logout:", forControlEvents: UIControlEvents.TouchUpInside)
            
            
            for var i = 0; i < 1650; i = i + 165
            {
                var j = CGFloat(45+i)
                
                var grayBox = UIView(frame: CGRectMake(5, j, UIScreen.mainScreen().bounds.width-10, 160))
                grayBox.backgroundColor = UIColor(red: 16.0, green: 16.0, blue: 16.0, alpha: 0.1)
                view.addSubview(grayBox)
            }
            
            
            iv_kd.image = UIImage(named: "kd.png")
            iv_overall.image = UIImage(named: "overall.png")
            iv_profile.image = UIImage(data: NSData(contentsOfURL: NSURL(string: stats["PlayerCardIcon"].asString!)))
            iv_tier.image = UIImage(data: NSData(contentsOfURL: NSURL(string: stats["PlayerCardTierIcon"].asString!)))
            
            // ---
            userLabel.textColor = UIColor.lightGrayColor()
            userLabel.textAlignment = NSTextAlignment.Right
            userLabel.font = UIFont(name: "Helvetica Neue", size: 14.0)
            userLabel.text = NSString(format: "%@", user)
            
            //---
            killLabel.textColor = UIColor.cyanColor()
            killLabel.textAlignment = NSTextAlignment.Right
            killLabel.text = NSString(format: "%.0f kills", kills)
            
            deathLabel.textColor = UIColor.orangeColor()
            deathLabel.textAlignment = NSTextAlignment.Right
            deathLabel.text = NSString(format: "%.0f deaths", deaths)
            
            kdLabel.textColor = UIColor.cyanColor()
            kdLabel.textAlignment = NSTextAlignment.Right
            kdLabel.text = NSString(format: "K/D: %.3f", kills/deaths)
            
            // ---
            winssLabel.textColor = UIColor.cyanColor()
            winssLabel.textAlignment = NSTextAlignment.Right
            winssLabel.text = NSString(format: "%@ wins", stats["GameWins"].asString!)
            
            lossesLabel.textColor = UIColor.orangeColor()
            lossesLabel.textAlignment = NSTextAlignment.Right
            lossesLabel.text = NSString(format: "%@ losses", stats["GameLosses"].asString!)
            
            wlLabel.textColor = UIColor.cyanColor()
            wlLabel.textAlignment = NSTextAlignment.Right
//            var wl =
            wlLabel.text = NSString(format: "W/L: %.2f", (NSString(string: stats["GameWins"].asString!).doubleValue / NSString(string: stats["GameLosses"].asString!).doubleValue) )
            
            pointsLabel.textColor = UIColor.cyanColor()
            pointsLabel.textAlignment = NSTextAlignment.Right
            pointsLabel.text = NSString(format: "%@ pts", stats["Score"].asString!)
            
            challengesLabel.textColor = UIColor.cyanColor()
            challengesLabel.textAlignment = NSTextAlignment.Right
            challengesLabel.text = NSString(format: "%@ challenges", stats["ChallengesCompleted"].asString!)
        }
        
        
        view.addSubview(iv_profile)
        view.addSubview(iv_tier)
        view.addSubview(iv_kd)
        view.addSubview(iv_overall)
        view.addSubview(killLabel)
        view.addSubview(deathLabel)
        view.addSubview(kdLabel)
        
        view.addSubview(userLabel)
        view.addSubview(winssLabel)
        view.addSubview(lossesLabel)
        view.addSubview(wlLabel)
        view.addSubview(pointsLabel)
        view.addSubview(challengesLabel)
        view.addSubview(logoutButton)
        
        
        
    
    }
    
    func logout(sender: UIButton)
    {
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = paths.stringByAppendingPathComponent("data.plist")
        var fileManager = NSFileManager.defaultManager()
        
        if (!(fileManager.fileExistsAtPath(path)))
        {
            var bundle : NSString = NSBundle.mainBundle().pathForResource("data", ofType: "plist")!
            fileManager.copyItemAtPath(bundle, toPath: path, error:nil)
        }
        
        let clear = ""
        clear.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
        NSLog("Logged out")
        NSLog("File cleared!")
        
        
        let vc = ViewController()
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func loadView()
    {
        self.view = self.scrollView
        self.scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height*3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
