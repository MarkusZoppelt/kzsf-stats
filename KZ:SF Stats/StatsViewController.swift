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
    let iv_wl = UIImageView(frame: CGRectMake(10, 2*165+50, 150, 150))
    let iv_missions = UIImageView(frame: CGRectMake(10, 3*165+50, 150, 150))
    
    
    
    
    
    // EPIC LIST OF STAT-LABELS
    
    let userLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 0*165+40, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let pointsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 0*165 + 100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let challengesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 0*165 + 130, UIScreen.mainScreen().bounds.width/2-30, 50))
//    let timeLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 0*165 + 160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let killLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165+100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let deathLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165+130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let kdLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165+160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let gamesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 40, UIScreen.mainScreen().bounds.width/2-30, 50))
    let winssLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 70, UIScreen.mainScreen().bounds.width/2-30, 50))
    let lossesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let drawsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let wlLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let missionsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 40, UIScreen.mainScreen().bounds.width/2-30, 50))
    let missionwinssLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 70, UIScreen.mainScreen().bounds.width/2-30, 50))
    let missionlossesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let missionwlLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let missionpointsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    
    
    
    
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
            iv_wl.image = UIImage(named: "wl.png")
            iv_missions.image = UIImage(named: "missions.png")
            iv_profile.image = UIImage(data: NSData(contentsOfURL: NSURL(string: stats["PlayerCardIcon"].asString!)))
            iv_tier.image = UIImage(data: NSData(contentsOfURL: NSURL(string: stats["PlayerCardTierIcon"].asString!)))
            
            // ---
            userLabel.textColor = UIColor.lightGrayColor()
            userLabel.textAlignment = NSTextAlignment.Right
//            NSLog("%@", UIFont.familyNames())
            userLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            userLabel.text = NSString(format: "%@", user)
            
            //---
            killLabel.textColor = UIColor.cyanColor()
            killLabel.textAlignment = NSTextAlignment.Right
            killLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            killLabel.text = NSString(format: "%.0f kills", kills)
            
            deathLabel.textColor = UIColor.orangeColor()
            deathLabel.textAlignment = NSTextAlignment.Right
            deathLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            deathLabel.text = NSString(format: "%.0f deaths", deaths)
            
            kdLabel.textColor = UIColor.cyanColor()
            kdLabel.textAlignment = NSTextAlignment.Right
            kdLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            kdLabel.text = NSString(format: "K/D: %.3f", kills/deaths)
            
            // ---
            
            gamesLabel.textColor = UIColor.whiteColor()
            gamesLabel.textAlignment = NSTextAlignment.Right
            gamesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            gamesLabel.text = NSString(format: "%.0f games", (NSString(string: stats["GameWins"].asString!).doubleValue + NSString(string: stats["GameLosses"].asString!).doubleValue))
            
            winssLabel.textColor = UIColor.cyanColor()
            winssLabel.textAlignment = NSTextAlignment.Right
            winssLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            winssLabel.text = NSString(format: "%@ wins", stats["GameWins"].asString!)
            
            lossesLabel.textColor = UIColor.orangeColor()
            lossesLabel.textAlignment = NSTextAlignment.Right
            lossesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            lossesLabel.text = NSString(format: "%@ losses", stats["GameLosses"].asString!)
            
            
            if let draws = stats["GameDraws"].asString
            {
                drawsLabel.textColor = UIColor.whiteColor()
                drawsLabel.textAlignment = NSTextAlignment.Right
                drawsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
                drawsLabel.text = NSString(format: "%@ draws", stats["GameDraws"].asString!)
            }
            
            wlLabel.textColor = UIColor.cyanColor()
            wlLabel.textAlignment = NSTextAlignment.Right
            wlLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            wlLabel.text = NSString(format: "W/L: %.2f", (NSString(string: stats["GameWins"].asString!).doubleValue / NSString(string: stats["GameLosses"].asString!).doubleValue) )
            
            
            // ---
            
            missionsLabel.textColor = UIColor.whiteColor()
            missionsLabel.textAlignment = NSTextAlignment.Right
            missionsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            

            missionsLabel.text = NSString(format: "%.0f missions", (NSString(string: stats["MissionWins"].asString!).doubleValue + (NSString(string: stats["MissionLosses"].asString!).doubleValue)))
            
            
            missionwinssLabel.textColor = UIColor.cyanColor()
            missionwinssLabel.textAlignment = NSTextAlignment.Right
            missionwinssLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            missionwinssLabel.text = NSString(format: "%@ mission wins", stats["MissionWins"].asString!)
            
            missionlossesLabel.textColor = UIColor.orangeColor()
            missionlossesLabel.textAlignment = NSTextAlignment.Right
            missionlossesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            missionlossesLabel.text = NSString(format: "%@ mission losses", stats["MissionLosses"].asString!)
            
            
            missionwlLabel.textColor = UIColor.cyanColor()
            missionwlLabel.textAlignment = NSTextAlignment.Right
            missionwlLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            missionwlLabel.text = NSString(format: "Mission W/L: %.2f", (NSString(string: stats["MissionWins"].asString!).doubleValue / NSString(string: stats["MissionLosses"].asString!).doubleValue) )

            missionpointsLabel.textColor = UIColor.orangeColor()
            missionpointsLabel.textAlignment = NSTextAlignment.Right
            missionpointsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            missionpointsLabel.text = NSString(format: "%@ mission points", stats["MissionPoints"].asString!)
            
            // ---
            pointsLabel.textColor = UIColor.cyanColor()
            pointsLabel.textAlignment = NSTextAlignment.Right
            pointsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            pointsLabel.text = NSString(format: "%@ points", stats["Score"].asString!)
            
            challengesLabel.textColor = UIColor.cyanColor()
            challengesLabel.textAlignment = NSTextAlignment.Right
            challengesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            challengesLabel.text = NSString(format: "%@ challenges", stats["ChallengesCompleted"].asString!)
            
//            timeLabel.textColor = UIColor.cyanColor()
//            timeLabel.textAlignment = NSTextAlignment.Right
//            timeLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
//            timeLabel.text = NSString(format: "Time played:: %@ d %@ h %@ m", (NSString(string: stats["TimePlayed"].asString!).integerValue/60/60), (NSString(string: stats["TimePlayed"].asString!).integerValue/60-(NSString(string: stats["GameWins"].asString!).integerValue/24/60), (NSString(string: stats["GameWins"].asString!).integerValue)))
            
        }
        
        
        view.addSubview(iv_profile)
        view.addSubview(iv_tier)
        view.addSubview(iv_kd)
        view.addSubview(iv_wl)
        view.addSubview(iv_missions)
        view.addSubview(killLabel)
        view.addSubview(deathLabel)
        view.addSubview(kdLabel)
        
        view.addSubview(userLabel)
        view.addSubview(gamesLabel)
        view.addSubview(winssLabel)
        view.addSubview(lossesLabel)
        view.addSubview(drawsLabel)
        view.addSubview(wlLabel)
        
        view.addSubview(missionsLabel)
        view.addSubview(missionwinssLabel)
        view.addSubview(missionlossesLabel)
        view.addSubview(missionwlLabel)
        view.addSubview(missionpointsLabel)
        
        view.addSubview(pointsLabel)
        view.addSubview(challengesLabel)
//        view.addSubview(timeLabel)
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
