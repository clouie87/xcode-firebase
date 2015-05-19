//
//  ChallengesTableViewController.swift
//  capture
//
//  Created by Caroline Louie on 2015-05-16.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

class ChallengesTableViewController: UITableViewController {
    
    var challenges: JSON! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("we are in first controller")
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        println(data.count)
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChallengeCell") as! ChallengeTableViewCell
        
        let challenge = data[indexPath.row]
        
        let title = challenge["title"].string!
        let id = challenge["id"].string!
        
        
        println(id)
        cell.titleLabel.text = title
        cell.imageImageView.image = UIImage(named: "pic " + id)
        
        
        cell.configureWithChallenge(challenge)
        
        return cell
    }

    
    
//    println("this is in challenges")
    
}
