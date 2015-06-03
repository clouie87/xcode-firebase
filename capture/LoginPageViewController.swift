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
    
    @IBOutlet weak var emailImageView: SpringImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var passwordImageView: SpringImageView!
    @IBOutlet weak var dialogView: DesignableView!
    
    var ref = Firebase(url: "https://xcode-capture.firebaseio.com/users/")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
    }
    
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if textField == emailTextField {
            emailImageView.image = UIImage(named: "Shape")
            emailImageView.animate()
        } else {
            emailImageView.image = UIImage(named: "email")
        }
        
        if textField == passwordTextField {
            passwordImageView.image = UIImage(named: "email")
            passwordImageView.animate()
        } else {
            passwordImageView.image = UIImage(named: "Shape")
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        emailImageView.image = UIImage(named: "email")
        passwordImageView.image=UIImage(named: "Shape")
    }
    
    
    
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
