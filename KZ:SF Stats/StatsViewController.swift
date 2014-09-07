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
    let refreshButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    
    
    
    // EPIC LIST OF PICTURES
    let iv_profile = UIImageView(frame: CGRectMake(10, 0*165+50, 150, 150))
    let iv_tier = UIImageView(frame: CGRectMake(10, 0*165+50, 150, 150))
    let iv_kd = UIImageView(frame: CGRectMake(20, 1*165+60, 130, 130))
    let iv_wl = UIImageView(frame: CGRectMake(20, 2*165+60, 130, 130))
    let iv_missions = UIImageView(frame: CGRectMake(20, 3*165+60, 130, 130))
    
    
    // EPIC LIST OF GRAPHS
    let gr_kd = UIProgressView(frame: CGRectMake(15, 1*165+190, UIScreen.mainScreen().bounds.width/2-30, 50))
    let gr_wl = UIProgressView(frame: CGRectMake(15, 2*165+190, UIScreen.mainScreen().bounds.width/2-30, 50))
    let gr_wlm = UIProgressView(frame: CGRectMake(15, 3*165+190, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    
    // EPIC LIST OF STAT-LABELS
    
    let userLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 0*165+40, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let pointsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 0*165 + 100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let challengesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 0*165 + 130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let ppmLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 0*165 + 160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let t_kdLabel = UILabel(frame: CGRectMake(10, 1*165+35, UIScreen.mainScreen().bounds.width/2-30, 50))
    let killLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165+100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let deathLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165+130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let kdLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165+160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let t_wlLabel = UILabel(frame: CGRectMake(10, 2*165+35, UIScreen.mainScreen().bounds.width/2-30, 50))
    let gamesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 40, UIScreen.mainScreen().bounds.width/2-30, 50))
    let winssLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 70, UIScreen.mainScreen().bounds.width/2-30, 50))
    let lossesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let drawsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let wlLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165 + 160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let t_missionLabel = UILabel(frame: CGRectMake(10, 3*165+35, UIScreen.mainScreen().bounds.width/2-30, 50))
    let missionsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 40, UIScreen.mainScreen().bounds.width/2-30, 50))
    let missionwinssLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 70, UIScreen.mainScreen().bounds.width/2-30, 50))
    let missionlossesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let missionwlLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let missionpointsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 3*165 + 160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let assistsLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 4*165 + 40, UIScreen.mainScreen().bounds.width/2-30, 50))
    let revivesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 4*165 + 70, UIScreen.mainScreen().bounds.width/2-30, 50))
    let meleeLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 4*165 + 100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let suicideLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 4*165 + 130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let cratesLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 4*165 + 160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let captureLabel = UILabel(frame: CGRectMake(20, 4*165 + 40, UIScreen.mainScreen().bounds.width/2-30, 50))
    let beaconLabel = UILabel(frame: CGRectMake(20, 4*165 + 70, UIScreen.mainScreen().bounds.width/2-30, 50))
    let echoLabel = UILabel(frame: CGRectMake(20, 4*165 + 100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let chargesLabel = UILabel(frame: CGRectMake(20, 4*165 + 130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let teamkillsLabel = UILabel(frame: CGRectMake(20, 4*165 + 160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        
            logoutButton.frame = CGRectMake(0, 0, 75, 50)
            logoutButton.backgroundColor=UIColor.clearColor()
            logoutButton.setTitle("Logout", forState: UIControlState.Normal)
            logoutButton.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
            logoutButton.addTarget(self, action: "logout:", forControlEvents: UIControlEvents.TouchUpInside)
            
            refreshButton.frame = CGRectMake(UIScreen.mainScreen().bounds.width-80, 5, 75, 50)
            refreshButton.backgroundColor = UIColor.clearColor()
            refreshButton.setTitle("Refresh", forState: UIControlState.Normal)
            refreshButton.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
            refreshButton.addTarget(self, action: "reload:", forControlEvents: UIControlEvents.TouchUpInside)
        
            let tapGesture = UITapGestureRecognizer(target: self, action: "reload:")
            tapGesture.numberOfTapsRequired = 2
            view.addGestureRecognizer(tapGesture)
        
            
            for var i = 0; i < 165*5; i = i + 165
            {
                var j = CGFloat(45+i)
                
                var grayBox = UIView(frame: CGRectMake(5, j, UIScreen.mainScreen().bounds.width-10, 160))
                grayBox.backgroundColor = UIColor(red: 16.0, green: 16.0, blue: 16.0, alpha: 0.1)
                view.addSubview(grayBox)
            }

        
            t_kdLabel.textColor = UIColor.lightGrayColor()
            t_kdLabel.textAlignment = NSTextAlignment.Left
            t_kdLabel.font = UIFont(name: "Avenir Next Condensed", size: 17.0)
            iv_kd.image = UIImage(named: "kd.png")
            
            t_wlLabel.textColor = UIColor.lightGrayColor()
            t_wlLabel.textAlignment = NSTextAlignment.Left
            t_wlLabel.font = UIFont(name: "Avenir Next Condensed", size: 17.0)
            iv_wl.image = UIImage(named: "wl.png")
            
            t_missionLabel.textColor = UIColor.lightGrayColor()
            t_missionLabel.textAlignment = NSTextAlignment.Left
            t_missionLabel.font = UIFont(name: "Avenir Next Condensed", size: 17.0)
            iv_missions.image = UIImage(named: "missions.png")
            
            // ---
            userLabel.textColor = UIColor.lightGrayColor()
            userLabel.textAlignment = NSTextAlignment.Right
            userLabel.font = UIFont(name: "Avenir Next Condensed", size: 20.0)
        
            //---
            killLabel.textColor = UIColor.cyanColor()
            killLabel.textAlignment = NSTextAlignment.Right
            killLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
            deathLabel.textColor = UIColor.orangeColor()
            deathLabel.textAlignment = NSTextAlignment.Right
            deathLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
            kdLabel.textColor = UIColor.cyanColor()
            kdLabel.textAlignment = NSTextAlignment.Right
            kdLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
            gr_kd.progressViewStyle=UIProgressViewStyle.Default
            gr_kd.progressTintColor = UIColor.cyanColor()
            gr_kd.trackTintColor = UIColor.orangeColor()
            
            
            // ---

            gamesLabel.textColor = UIColor.whiteColor()
            gamesLabel.textAlignment = NSTextAlignment.Right
            gamesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
            winssLabel.textColor = UIColor.cyanColor()
            winssLabel.textAlignment = NSTextAlignment.Right
            winssLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
            lossesLabel.textColor = UIColor.orangeColor()
            lossesLabel.textAlignment = NSTextAlignment.Right
            lossesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            drawsLabel.textColor = UIColor.whiteColor()
            drawsLabel.textAlignment = NSTextAlignment.Right
            drawsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
            wlLabel.textColor = UIColor.cyanColor()
            wlLabel.textAlignment = NSTextAlignment.Right
            wlLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
            gr_wl.progressViewStyle=UIProgressViewStyle.Default
            gr_wl.progressTintColor = UIColor.cyanColor()
            gr_wl.trackTintColor = UIColor.orangeColor()
            
            
            // ---
            missionwinssLabel.textColor = UIColor.cyanColor()
            missionwinssLabel.textAlignment = NSTextAlignment.Right
            missionwinssLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            missionlossesLabel.textColor = UIColor.orangeColor()
            missionlossesLabel.textAlignment = NSTextAlignment.Right
            missionlossesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
            missionsLabel.textColor = UIColor.whiteColor()
            missionsLabel.textAlignment = NSTextAlignment.Right
            missionsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
            
            missionwlLabel.textColor = UIColor.cyanColor()
            missionwlLabel.textAlignment = NSTextAlignment.Right
            missionwlLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            gr_wlm.progressViewStyle=UIProgressViewStyle.Default

            gr_wlm.progressTintColor = UIColor.cyanColor()
            gr_wlm.trackTintColor = UIColor.orangeColor()

            missionpointsLabel.textColor = UIColor.orangeColor()
            missionpointsLabel.textAlignment = NSTextAlignment.Right
            missionpointsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            pointsLabel.textColor = UIColor.cyanColor()
            pointsLabel.textAlignment = NSTextAlignment.Right
            pointsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            challengesLabel.textColor = UIColor.cyanColor()
            challengesLabel.textAlignment = NSTextAlignment.Right
            challengesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            ppmLabel.textColor = UIColor.cyanColor()
            ppmLabel.textAlignment = NSTextAlignment.Right
            ppmLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            assistsLabel.textColor = UIColor.cyanColor()
            assistsLabel.textAlignment = NSTextAlignment.Right
            assistsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            revivesLabel.textColor = UIColor.cyanColor()
            revivesLabel.textAlignment = NSTextAlignment.Right
            revivesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            meleeLabel.textColor = UIColor.cyanColor()
            meleeLabel.textAlignment = NSTextAlignment.Right
            meleeLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            suicideLabel.textColor = UIColor.orangeColor()
            suicideLabel.textAlignment = NSTextAlignment.Right
            suicideLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            cratesLabel.textColor = UIColor.cyanColor()
            cratesLabel.textAlignment = NSTextAlignment.Right
            cratesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            captureLabel.textColor = UIColor.cyanColor()
            captureLabel.textAlignment = NSTextAlignment.Right
            captureLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            beaconLabel.textColor = UIColor.cyanColor()
            beaconLabel.textAlignment = NSTextAlignment.Right
            beaconLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            echoLabel.textColor = UIColor.cyanColor()
            echoLabel.textAlignment = NSTextAlignment.Right
            echoLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            chargesLabel.textColor = UIColor.cyanColor()
            chargesLabel.textAlignment = NSTextAlignment.Right
            chargesLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)

            teamkillsLabel.textColor = UIColor.orangeColor()
            teamkillsLabel.textAlignment = NSTextAlignment.Right
            teamkillsLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
        
        view.addSubview(iv_profile)
        view.addSubview(iv_tier)
        
        view.addSubview(t_kdLabel)
        view.addSubview(iv_kd)
        view.addSubview(gr_kd)
        view.addSubview(t_wlLabel)
        view.addSubview(iv_wl)
        view.addSubview(gr_wl)
        view.addSubview(t_missionLabel)
        view.addSubview(iv_missions)
        view.addSubview(gr_wlm)
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
        view.addSubview(ppmLabel)
        
        view.addSubview(assistsLabel)
        view.addSubview(revivesLabel)
        view.addSubview(meleeLabel)
        view.addSubview(suicideLabel)
        view.addSubview(cratesLabel)

        view.addSubview(captureLabel)
        view.addSubview(beaconLabel)
        view.addSubview(echoLabel)
        view.addSubview(chargesLabel)
        view.addSubview(teamkillsLabel)
        
        
        view.addSubview(logoutButton)
//        view.addSubview(refreshButton)
        
        reload(refreshButton)
        
    
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
        self.scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 50+5*165)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func reload(sender: UIButton)
    {
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
            iv_profile.image = UIImage(data: NSData(contentsOfURL: NSURL(string: stats["PlayerCardIcon"].asString!)))
            iv_tier.image = UIImage(data: NSData(contentsOfURL: NSURL(string: stats["PlayerCardTierIcon"].asString!)))
            
            var kills = NSString(string: stats["Kills"].asString!).doubleValue
            var deaths = NSString(string: stats["Deaths"].asString!).doubleValue
            
            killLabel.text = NSString(format: "%.0f kills", kills)
            deathLabel.text = NSString(format: "%.0f deaths", deaths)
            kdLabel.text = NSString(format: "K/D: %.3f", kills/deaths)
            
            gr_kd.progress = Float(kills/(kills+deaths))
            
            
            // ---
            
            var wins = stats["GameWins"].asString
            if wins == nil
            {
                wins = "0"
            }
            var losses = stats["GameLosses"].asString
            if  losses == nil
            {
                losses = "0"
            }
            gamesLabel.text = NSString(format: "%.0f games", (NSString(string: wins!).doubleValue + NSString(string: losses!).doubleValue))
            winssLabel.text = NSString(format: "%@ wins", wins!)
            lossesLabel.text = NSString(format: "%@ losses", losses!)
            
            
            
            var draws = stats["GameDraws"].asString
            if  draws == nil
            {
                draws = "0"
            }
            drawsLabel.text = NSString(format: "%@ draws", draws!)
            
            var gameWins = stats["GameWins"].asString
            if  gameWins == nil
            {
                gameWins = "0"
            }
            var gameLosses = stats["GameLosses"].asString
            if  gameLosses == nil
            {
                gameLosses = "0"
            }
            wlLabel.text = NSString(format: "W/L: %.2f", (NSString(string: gameWins!).doubleValue / NSString(string: gameLosses!).doubleValue) )
            
            gr_wl.progress = Float(NSString(format: gameWins!).doubleValue/(NSString(format: gameWins!).doubleValue+NSString(format: gameLosses!).doubleValue))
            
            
            // ---
            var missionWins = stats["MissionWins"].asString
            if  missionWins == nil
            {
                missionWins = "0"
            }
            missionwinssLabel.text = NSString(format: "%@ mission wins", missionWins!)
            
            var missionLosses = stats["MissionLosses"].asString
            if  missionLosses == nil
            {
                missionLosses = "0"
            }
            missionlossesLabel.text = NSString(format: "%@ mission losses", missionLosses!)
            
            missionsLabel.text = NSString(format: "%.0f missions", (NSString(string: missionWins!).doubleValue + (NSString(string: missionLosses!).doubleValue)))
            
            missionwlLabel.text = NSString(format: "Mission W/L: %.2f", (NSString(string: missionWins!).doubleValue / NSString(string: missionLosses!).doubleValue) )
            
            gr_wlm.progress = Float(NSString(format: missionWins!).doubleValue/(NSString(format: missionWins!).doubleValue+NSString(format: missionLosses!).doubleValue))
            
            var missionPoints = stats["MissionPoints"].asString
            if  missionPoints == nil
            {
                missionPoints = "0"
            }
            missionpointsLabel.text = NSString(format: "%@ mission pts", missionPoints!)
            
            // ---
            var score = stats["Score"].asString
            if  score == nil
            {
                score = "0"
            }
            pointsLabel.text = NSString(format: "%@ points", score!)
            
            var challenges = stats["ChallengesCompleted"].asString
            if  challenges == nil
            {
                challenges = "0"
            }
            challengesLabel.text = NSString(format: "%@ challenges", challenges!)
            
            var time = stats["TimePlayed"].asString
            if  time == nil
            {
                time = "0"
            }
            ppmLabel.text = NSString(format: "%.1f points/min", NSString(string: score!).doubleValue / (NSString(string: time!).doubleValue / 60))
            
            
            var assists = stats["Assists"].asString
            if  assists == nil
            {
                assists = "0"
            }
            assistsLabel.text = NSString(format: "%@ assists", assists!)
            
            var revives = stats["AbilityReviveUsed"].asString
            if  revives == nil
            {
                revives = "0"
            }
            revivesLabel.text = NSString(format: "%@ revives", revives!)
            
            var melees = stats["MeleeKills"].asString
            if  melees == nil
            {
                melees = "0"
            }
            meleeLabel.text = NSString(format: "%@ melee kills", melees!)
            
            var suicides = stats["Suicides"].asString
            if  suicides == nil
            {
                suicides = "0"
            }
            suicideLabel.text = NSString(format: "%@ suicides", suicides!)
            
            var collectibles = stats["CollectiblesCollected"].asString
            if  collectibles == nil
            {
                collectibles = "0"
            }
            cratesLabel.text = NSString(format: "%@ collectibles", collectibles!)
            
            
            
            var CAScaptures = stats["CASCaptured"].asString
            if  CAScaptures == nil
            {
                CAScaptures = "0"
            }
            var CACcaptures = stats["CACCaptured"].asString
            if  CACcaptures == nil
            {
                CACcaptures = "0"
            }
            var CAHcaptures = stats["CAHCaptured"].asString
            if  CAHcaptures == nil
            {
                CAHcaptures = "0"
            }
            captureLabel.text = NSString(format: "%.0f captures", NSString(string: CAScaptures!).doubleValue + NSString(string: CACcaptures!).doubleValue + NSString(string: CAHcaptures!).doubleValue)
            
            var IARretrieved = stats["IARRetrieved"].asString
            if  IARretrieved == nil
            {
                IARretrieved = "0"
            }
            var SARretrieved = stats["SARRetrieved"].asString
            if  SARretrieved == nil
            {
                SARretrieved = "0"
            }
            beaconLabel.text = NSString(format: "%.0f beacons retrieved", NSString(string: SARretrieved!).doubleValue + NSString(string: IARretrieved!).doubleValue)
            
            var echos = stats["AbilityTacticalEchoEnemyTags"].asString
            if  echos  == nil
            {
                echos  = "0"
            }
            echoLabel.text = NSString(format: "%@ echo tags", echos!)
            
            
            var charges = stats["SADArmed"].asString
            if  charges == nil
            {
                charges = "0"
            }
            chargesLabel.text = NSString(format: "%@ charges armed", charges!)
            
            var teamkills = stats["TeamKills"].asString
            if  teamkills == nil
            {
                teamkills = "0"
            }
            teamkillsLabel.text = NSString(format: "%@ team kills", teamkills!)
            
            
        }
        
        NSLog("Data loaded")

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
