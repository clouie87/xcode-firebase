//
//  LoginPageVIewController.swift
//  capture
//
//  Created by Caroline Louie on 2015-05-16.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
    

    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    
    var ref = Firebase(url: "https://xcode-capture.firebaseio.com/users/")
    
    
    @IBAction func loginButtonDidTouch(sender: AnyObject) {
        ref.authUser(emailTextField.text as String, password: passwordTextField.text as String,
            withCompletionBlock: { error, authData in
                if error != nil {
                    println("There was an error logging in to this account")
                } else {
                    println("now logged in")
                }
        })

        //        return registered
    }
    
    
    
    @IBAction func registerButtonDidTouch(sender: AnyObject){
        ref.createUser(self.emailTextField.text as String, password: passwordTextField.text as String,withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                    println("there was an error")
                } else {
                    let uid = result["uid"] as? String
                    println("Successfully created user account with uid: \(uid)")
                    
                    
                    var user = [
                        "uid": uid as String!,
                        "name": self.emailTextField.text as String,
                        "password": self.passwordTextField.text as String
                    ]
                    
                    var usersRef = self.ref.childByAppendingPath(uid)
                    usersRef.setValue(user)
                    
            
                }
        
            })

        }
    
}
