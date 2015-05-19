//
//  SecondViewController.swift
//  capture
//
//  Created by Caroline Louie on 2015-05-07.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    
//    var myRootRef = Firebase(url: "https://xcode-capture.firebaseio.com/")
//    
//   
//    var ref = Firebase(url: "https://xcode-capture.firebaseio.com/users/")
//    
//    var alanisawesomer = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
//    var gracehop = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]
//

    @IBOutlet weak var imageImageView: DesignableImageView!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pic1 = "pic 1"
        imageImageView.image = UIImage(named: pic1)
        
        
        
        
//        var usersRef = ref.childByAppendingPath("users")
//        
//        var users = ["alanisawesome": alanisawesomer, "gracehop": gracehop]
//        usersRef.setValue(users)

//        usersRef.childByAppendingPath("alanisawesomer").setValue(alanisawesomer)
//        usersRef.childByAppendingPath("gracehop").setValue(gracehop)
//        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

