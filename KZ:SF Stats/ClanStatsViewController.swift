//
//  ClanStatsViewController.swift
//  KZ:SF Stats
//
//  Created by Markus Zoppelt on 08.09.14.
//  Copyright (c) 2014 Markus Zoppelt. All rights reserved.
//

import UIKit

class ClanStatsViewController: UIViewController {
    
    let scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
    let circProg = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
    
    let loadingLabel  = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2-150, UIScreen.mainScreen().bounds.height/2+30, 300, 50))
    
    let iv_trophy = UIImageView(frame: CGRectMake(20, 1*165-40+60, 130, 130))
    let iv_bil = UIImageView(frame: CGRectMake(20, 2*165-40+60, 130, 130))
    
    let gr_wlClan = UIProgressView(frame: CGRectMake(15, 2*165-40+190, UIScreen.mainScreen().bounds.width/2-30, 50))

    let clanNameLabel = UILabel(frame: CGRectMake(25, 0*165-40+70, UIScreen.mainScreen().bounds.width-50, 125))
    let clanTagLabel = UILabel(frame: CGRectMake(25, 0*165-40+100, UIScreen.mainScreen().bounds.width-50, 125))
    
    let memberCountLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165-40+70, UIScreen.mainScreen().bounds.width/2-30, 50))
    let ELOLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165-40+100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let winStreakLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 1*165-40+130, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    let gamesPlayedLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165-40+40, UIScreen.mainScreen().bounds.width/2-30, 50))
    let gamesWonLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165-40+70, UIScreen.mainScreen().bounds.width/2-30, 50))
    let gamesDrawnLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165-40+100, UIScreen.mainScreen().bounds.width/2-30, 50))
    let gamesLostLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165-40+130, UIScreen.mainScreen().bounds.width/2-30, 50))
    let wlClanLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+10, 2*165-40+160, UIScreen.mainScreen().bounds.width/2-30, 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blackColor()
        
        let backSwiper = UISwipeGestureRecognizer(target: self, action: "goBack:")
        backSwiper.direction = UISwipeGestureRecognizerDirection.Right
        
        /// Loading ---
        
        loadingLabel.textColor = UIColor.cyanColor()
        loadingLabel.textAlignment = NSTextAlignment.Center
        loadingLabel.font = UIFont(name: "Avenir Next Condensed", size: 11.0)
        loadingLabel.text = "Loading clan info"
        loadingLabel.backgroundColor = UIColor.clearColor()
        self.view.addSubview(loadingLabel)
        
        circProg.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, UIScreen.mainScreen().bounds.height/2)
        circProg.color = UIColor.cyanColor()
        self.view.addSubview(circProg)
        
        /// Loading ---
        
        view.addGestureRecognizer(backSwiper)
        
        iv_bil.image = UIImage(named: "clan_bil.png")
        iv_trophy.image = UIImage(named: "clan_trophy.png")
        
        gr_wlClan.progressViewStyle=UIProgressViewStyle.Default
        gr_wlClan.progressTintColor = UIColor.cyanColor()
        gr_wlClan.trackTintColor = UIColor.orangeColor()

        
        clanNameLabel.textColor = UIColor.lightGrayColor()
        clanNameLabel.textAlignment = NSTextAlignment.Center
        clanNameLabel.font = UIFont(name: "Avenir Next Condensed", size: 30.0)
        
        clanTagLabel.textColor = UIColor.yellowColor()
        clanTagLabel.textAlignment = NSTextAlignment.Center
        clanTagLabel.font = UIFont(name: "Avenir Next Condensed", size: 25.0)
        
        memberCountLabel.textColor = UIColor.cyanColor()
        memberCountLabel.textAlignment = NSTextAlignment.Right
        memberCountLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
        winStreakLabel.textColor = UIColor.cyanColor()
        winStreakLabel.textAlignment = NSTextAlignment.Right
        winStreakLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
        ELOLabel.textColor = UIColor.cyanColor()
        ELOLabel.textAlignment = NSTextAlignment.Right
        ELOLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
        gamesPlayedLabel.textColor = UIColor.whiteColor()
        gamesPlayedLabel.textAlignment = NSTextAlignment.Right
        gamesPlayedLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
        gamesWonLabel.textColor = UIColor.cyanColor()
        gamesWonLabel.textAlignment = NSTextAlignment.Right
        gamesWonLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
        gamesDrawnLabel.textColor = UIColor.whiteColor()
        gamesDrawnLabel.textAlignment = NSTextAlignment.Right
        gamesDrawnLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
        gamesLostLabel.textColor = UIColor.orangeColor()
        gamesLostLabel.textAlignment = NSTextAlignment.Right
        gamesLostLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
        wlClanLabel.textColor = UIColor.cyanColor()
        wlClanLabel.textAlignment = NSTextAlignment.Right
        wlClanLabel.font = UIFont(name: "Avenir Next Condensed", size: 15.0)
        
        for var i = 0; i < 165*3; i = i + 165
        {
            //                var j = CGFloat(45+i)
            var j = CGFloat(5 + i)
            
            var grayBox = UIView(frame: CGRectMake(5, j, UIScreen.mainScreen().bounds.width-10, 160))
            grayBox.backgroundColor = UIColor(red: 16.0, green: 16.0, blue: 16.0, alpha: 0.1)
            view.addSubview(grayBox)
        }
        
        
        view.addSubview(clanNameLabel)
        view.addSubview(clanTagLabel)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        circProg.startAnimating()
    }
    
    override func viewDidAppear(animated: Bool) {
        reload()
        circProg.stopAnimating()
        loadingLabel.text = ""
    }
    
    override func loadView()
    {
        self.view = self.scrollView
        self.scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 50+3*165-40)
        
    }
    
    func goBack(sender: UIGestureRecognizer)
    {
        let vc = ViewController()
        navigationController?.popViewControllerAnimated(true)
    }

    func reload()
    {
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = paths.stringByAppendingPathComponent("data.plist")
        var user = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
        let clanInfo = JSON.fromURL("http://killzone4.online.scee.com/api/clan/get-clan-for-user/\(user)")
        
        var clanTag = clanInfo["tag"].asString
        if  clanTag == nil
        {
            clanTag = "-"
//            goBack(UIGestureRecognizer())
            
            clanNameLabel.text = "THIS USER IS IN NO CLAN"
            
            self.scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 50+1*165-40)
        }
        else
        {
            
            
            
            view.addSubview(iv_bil)
            view.addSubview(iv_trophy)
            
            view.addSubview(memberCountLabel)
            view.addSubview(winStreakLabel)
            view.addSubview(ELOLabel)
            view.addSubview(gamesPlayedLabel)
            view.addSubview(gamesWonLabel)
            view.addSubview(gamesDrawnLabel)
            view.addSubview(gamesLostLabel)
            view.addSubview(wlClanLabel)
            
            view.addSubview(gr_wlClan)
            
            loadingLabel.text = "Fetching clan info"
            NSLog("Checking http://killzone4.online.scee.com/api/clan/get-stats/\(clanTag!)")
            let clanStats = JSON.fromURL("http://killzone4.online.scee.com/api/clan/get-stats/\(clanTag!)")
            
            clanTagLabel.text = "[" + "\(clanTag!)" + "]"
            clanNameLabel.text = clanInfo["name"].asString
            
            var memberArray = clanInfo["member"].asArray
            var memberCount = memberArray?.count
            
            NSLog("MemberCount is \(memberCount!)")
            
            memberCountLabel.text = NSString(format: "%d member", memberCount!)
            
            var winStreak = clanStats["WinStreak"].asString
            if  winStreak == nil
            {
                winStreak = "0"
            }
            winStreakLabel.text = NSString(format: "Highest winstreak: %@", winStreak!)
            
            var gamesWon = clanStats["GamesWon"].asString
            if  gamesWon == nil
            {
                gamesWon = "0"
            }
            gamesWonLabel.text = NSString(format: "%@ games won", gamesWon!)
            
            var elo = clanStats["ELO"].asString
            if  elo == nil
            {
                elo = "0"
            }
            ELOLabel.text = NSString(format: "ELO: %.2f", NSString(string: elo!).doubleValue)
            
            var gamesDrawn = clanStats["GamesDrawn"].asString
            if  gamesDrawn == nil
            {
                gamesDrawn = "0"
            }
            gamesDrawnLabel.text = NSString(format: "%@ games drawn", gamesDrawn!)
            
            var gamesPlayed = clanStats["GamesPlayed"].asString
            if  gamesPlayed == nil
            {
                gamesPlayed = "0"
            }
            gamesPlayedLabel.text = NSString(format: "%@ games played", gamesPlayed!)
            
            var gamesLost = clanStats["GamesLost"].asString
            if  gamesLost == nil
            {
                gamesLost = "0"
            }
            gamesLostLabel.text = NSString(format: "%@ games lost", gamesLost!)
            
            wlClanLabel.text = NSString(format: "W/L: %.3f", Float(NSString(string: gamesWon!).doubleValue/(NSString(string: gamesLost!).doubleValue+NSString(string: gamesWon!).doubleValue)))
            
            gr_wlClan.progress = Float(NSString(string: gamesWon!).doubleValue/(NSString(string: gamesLost!).doubleValue+NSString(string: gamesWon!).doubleValue))
            
            // ---
            
            loadingLabel.text = "Fetching clan member"
            self.scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 50+CGFloat(3+memberCount!)*165-40)
            var i:Int = 2*165
            
            for member in memberArray!
            {
                var memberName = member["id"].asString
                var memberRole = member["role"].asString
                let memberInfo = JSON.fromURL("http://killzone4.online.scee.com/api/profile/get-competitive/\(memberName!)")
                
                var memberCardIcon = memberInfo["PlayerCardIcon"].asString
                var memberTierIcon = memberInfo["PlayerCardTierIcon"].asString
                
                i = i + 165
                var iv_profile = UIImageView(frame: CGRectMake(10, CGFloat(i)-40+50, 150, 150))
                var iv_tier = UIImageView(frame: CGRectMake(10, CGFloat(i)-40+50, 150, 150))

                iv_profile.image = UIImage(data: NSData(contentsOfURL: NSURL(string: memberCardIcon!)))
                iv_tier.image = UIImage(data: NSData(contentsOfURL: NSURL(string: memberTierIcon!)))
                view.addSubview(iv_profile)
                view.addSubview(iv_tier)
                
                var j = CGFloat(5 + i)
                var grayBox = UIView(frame: CGRectMake(5, j, UIScreen.mainScreen().bounds.width-10, 160))
                grayBox.backgroundColor = UIColor(red: 16.0, green: 16.0, blue: 16.0, alpha: 0.1)
                view.addSubview(grayBox)
                
                
                var nameLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2+5, CGFloat(i+27), UIScreen.mainScreen().bounds.width/2-10, 125))
                nameLabel.text = memberName
                nameLabel.textColor = UIColor.cyanColor()
                nameLabel.textAlignment = NSTextAlignment.Center
                nameLabel.font = UIFont(name: "Avenir Next Condensed", size: 22.0)
                view.addSubview(nameLabel)
                
                var roleLabel = UILabel(frame: CGRectMake(25, CGFloat(i-30), UIScreen.mainScreen().bounds.width-50, 125))
                roleLabel.text = memberRole
                roleLabel.textColor = UIColor.orangeColor()
                roleLabel.textAlignment = NSTextAlignment.Center
                roleLabel.font = UIFont(name: "Avenir Next Condensed", size: 16.0)
                view.addSubview(roleLabel)
                
                
            }

        
        NSLog("Data loaded")
        
        }
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
