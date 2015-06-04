//
//  ChallengesTableViewController.swift
//  capture
//
//  Created by Caroline Louie on 2015-05-16.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

class ChallengesTableViewController: UITableViewController, ChallengeTableViewCellDelegate, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var challenges: JSON! = []
    var isPresenting: Bool!
    var point: CGPoint!
    let animationDuration = 0.3
    
    
    @IBOutlet weak var firstNavItem: UINavigationItem!
    
    @IBOutlet weak var LogoutButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("we are in first controller")
        let dvc = DetailViewController(nibName: "DetailViewController", bundle: nil)

        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navBarImage"), forBarMetrics: UIBarMetrics.Default)
        
    }
    
   
    @IBAction func logoutButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("LogoutSegue", sender: self)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChallengeCell") as! ChallengeTableViewCell
    
        
        let challenge = data[indexPath.row]
        
        let title = challenge["title"].string!
        let id = challenge["id"].string!
    
        cell.titleLabel.text = title
        cell.imageImageView.image = UIImage(named: "pic " + id)
        
        cell.configureWithChallenge(challenge)
        
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        tableView.deselectRowAtIndexPath(indexPath, animated: true)

//        let nib = UINib(nibName: "DetailViewController", bundle: nil)
//        let dvc = DetailViewController(nibName: "DetailViewController", bundle: nil)
//        dvc.challenge = self.challenges[indexPath.row]
//        dvc.transitioningDelegate = self
//        dvc.modalPresentationStyle = UIModalPresentationStyle.Custom
        
//        self.point = CGPointMake(currRect.midX, currRect.midY)
//        self.presentViewController(dvc, animated: true, completion: nil)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChallengeCell") as! ChallengeTableViewCell
        
//        spring(0.5) {
//            println("spring animation will happen")
//            cell.imageImageView.frame = CGRectMake(0, 0, 240, 240)
//            cell.imageImageView.transform = CGAffineTransformMakeTranslation(0, 100)
//        }
        
        println("we are in the row")
//        self.presentViewController(viewControllerToPresent: "DetailViewController", animated: true, completion: nil)
        
        
    }
    
    
    // MARK: Functions to deal with whether the transitions should happnen
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    // MARK: Functions for duration and entry point so we perform transitions
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return animationDuration
    }
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView();
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        toViewController!.view.frame = fromViewController!.view.frame
        
        if(self.isPresenting == true){
            toViewController!.view.alpha = 0;
            toViewController!.view.transform = CGAffineTransformMakeScale(0, 0)
            
            UIView.animateWithDuration(animationDuration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
                toViewController!.view.alpha = 1;
                toViewController!.view.transform = CGAffineTransformMakeScale(1, 1)
                containerView.addSubview(toViewController!.view)
                }, completion: { (completed) -> Void in
                    transitionContext.completeTransition(completed)
            })
            
        } else {
            
            UIView.animateWithDuration(animationDuration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
                toViewController!.view.alpha = 1;
                toViewController!.view.transform = CGAffineTransformMakeScale(1, 1)
                containerView.addSubview(toViewController!.view)
                }, completion: { (completed) -> Void in
                    transitionContext.completeTransition(completed)
            })
        }
        
        
    }
    
    
    
     // MARK: ChallengeTableViewCellDelegate
    
    func challengeTableViewCellDidTouchNext(cell: ChallengeTableViewCell, sender: AnyObject) {
        
        
        spring(1.5) {
            println("spring animation will happen")
            cell.imageImageView.frame = CGRectMake(50, 0, 240, 240)
            cell.imageImageView.transform = CGAffineTransformMakeTranslation(-10, 120)
            cell.maskVisualEffectVIew.transform = CGAffineTransformMakeTranslation(2, 100)
            cell.maskTitleVisualEffectView.alpha = 0
            
            
        }
        
        springWithDelay(1.5, 1.5) { () -> Void in
            self.performSegueWithIdentifier("SubmitSegue", sender: cell)
        }

                println("will perform segue here")
//
    }
    
    
    //MARK: Misc
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SubmitSegue" {
            println("preping for segue")
            let toView = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
//            toView.challenge = challenges[indexPath.row]
        }
        
    }
    
   
    
    
//    println("this is in challenges")
    
}
