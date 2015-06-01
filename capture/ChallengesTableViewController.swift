//
//  ChallengesTableViewController.swift
//  capture
//
//  Created by Caroline Louie on 2015-05-16.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

class ChallengesTableViewController: UITableViewController, ChallengeTableViewCellDelegate {
    
    var challenges: JSON! = []
    
    @IBOutlet weak var firstNavItem: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("we are in first controller")
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navBarImage"), forBarMetrics: UIBarMetrics.Default)
        
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
        
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("we are in the row")
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

    }
    
     // MARK: ChallengeTableViewCellDelegate
    
    func challengeTableViewCellDidTouchNext(cell: ChallengeTableViewCell, sender: AnyObject) {
                println("will perform segue here")
        performSegueWithIdentifier("SubmitSegue", sender: cell)
    }
    
    
    //MARK: Misc
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SubmitSegue" {
            println("preping for segue")
            let toView = segue.destinationViewController as! SubmitsTableViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
//            toView.challenge = challenges[indexPath.row]
        }
    }
    
   
    
    
//    println("this is in challenges")
    
}
