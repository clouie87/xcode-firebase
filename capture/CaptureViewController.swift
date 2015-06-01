//
//  CaptureViewController.swift
//  capture
//
//  Created by Caroline Louie on 2015-05-30.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cameraImageView: UIImageView!
    
    @IBOutlet weak var cameraDetailImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        springWithDelay(0.2, 0.6) {
            self.titleLabel.alpha = 0
            self.cameraDetailImageView.alpha = 0

        }
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
//        springWithDelay(2, 5) {
            UIView.animateWithDuration(0.8, animations: {
                //            self.dialogView.frame = CGRectMake(0, 0, 360, 568)
                self.cameraDetailImageView.alpha = 0
                self.cameraImageView.frame = CGRectMake(20, 144, 280, 280)
                
                
                self.cameraImageView.alpha = 0.3
                
                
                }, completion: {finished in
                    self.performSegueWithIdentifier("captureToLogin", sender: self)
            })
//
//        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
