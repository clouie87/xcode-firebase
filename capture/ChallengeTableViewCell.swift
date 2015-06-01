//
//  ChallengeTableViewCell.swift
//  capture
//
//  Created by Caroline Louie on 2015-05-18.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

protocol ChallengeTableViewCellDelegate: class{
    func challengeTableViewCellDidTouchNext(cell: ChallengeTableViewCell, sender: AnyObject)
}


class ChallengeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
   
    
    @IBOutlet weak var heartConfirmButton: SpringButton!
    
    @IBOutlet weak var likeButton: SpringButton!
    
    @IBOutlet weak var heartConfirmedButton: SpringButton!
    
    
    @IBOutlet weak var nextButton: SpringButton!
   
    @IBOutlet weak var challengeImageView: DesignableImageView!
    @IBOutlet weak var titleImageView: UIImageView!
    
    weak var delegate: ChallengeTableViewCellDelegate?
    
    
    @IBAction func nextButtonDidTouch(sender: AnyObject) {
        
        delegate?.challengeTableViewCellDidTouchNext(self, sender: sender)
         println("button clicked")
        
    }
    
    
    @IBAction func likeButtonDidTouch(sender: AnyObject) {
//        heartConfirmButton.alpha = 0
        heartConfirmButton.hidden = false
        
        heartConfirmButton.animation = "pop"
        heartConfirmButton.duration = 1
        heartConfirmButton.animate()
        
        
        springWithDelay(0.6, 0.5) {
            self.heartConfirmedButton.hidden = false
            self.heartConfirmButton.alpha = 0
            
        }
    }
    
    func configureWithChallenge(challenge: JSON) {
        let title = data["title"].string
        
        
        let id = challenge["id"].string
        
//        imageImageView.image = UIImage(named: "pic 3")
//        titleLabel.text = title
        
//        println(title)
        
    }
    
    
    

}
