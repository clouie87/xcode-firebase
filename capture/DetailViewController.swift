//
//  DetailViewController.swift
//  capture
//
//  Created by Caroline Louie on 2015-06-03.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

//protocol DetaileViewControllerDelegate: class{
//    func challengeTableViewCellDidTouchNext(cell: ChallengeTableViewCell, sender: AnyObject)
//}

class DetailViewController: UIViewController {

        @IBOutlet weak var bgImage: UIImageView!
        var challenge: JSON!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            println("made it to the Detail View Controller")
//            //        let id = challenge["id"].string!
            self.bgImage.image = UIImage(named: "pic 1")
    }
//
//
////            self.bgImage.contentMode = UIViewContentMode.ScaleAspectFill
//            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("handlePan:"))
//            self.bgImage.addGestureRecognizer(panGestureRecognizer)
////
////            // Do any additional setup after loading the view.
//        }
////
//        func handlePan(sender: UIPanGestureRecognizer) {
//            if(sender.state == UIGestureRecognizerState.Ended){
//                self.dismissViewControllerAnimated(true, completion:nil)
//            }
//        }
//
//        override func viewWillAppear(animated: Bool) {
//            
//            
//        }
//        
//        
//        
//        override func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
//            // Dispose of any resources that can be recreated.
//        }
//        
    
        /*
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        }
        */
        
    }
