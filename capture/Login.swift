//
//  Login.swift
//  capture
//
//  Created by Caroline Louie on 2015-05-16.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

class Login: UITableViewController {

        var ref = Firebase(url: "https://xcode-capture.firebaseio.com/challenges/")
    
//    let pic1.image = UIImage(named: "pic 1")
    
    var challenge1 = [
        "uid": "simplelogin:12" as String!,
        "name": "me@me.ca",
        "pic": "pic1"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
      
                var usersRef = ref.childByAppendingPath("challenge")
        
                var challenges = ["simgplelogin:12": challenge1]
                usersRef.setValue(challenges)
        
        

        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
         tableView.estimatedRowHeight = 500
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LoggingInCell") as! LoggingInTableViewCell
        
        let background = indexPath.row
        
        cell.backgroundImageView.image = UIImage(named: "untiled-5")
        
        return cell
    }
    
}
