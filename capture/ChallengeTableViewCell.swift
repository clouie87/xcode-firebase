//
//  ChallengeTableViewCell.swift
//  capture
//
//  Created by Caroline Louie on 2015-05-18.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
    
//        println("we are in challenge table view cell controller")
//        
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    func configureWithChallenge(challenge: JSON) {
        let title = data["title"].string
        
        
        let id = challenge["id"].string
        
//        imageImageView.image = UIImage(named: "pic 3")
//        titleLabel.text = title
        
//        println(title)
        
    }
    

}
