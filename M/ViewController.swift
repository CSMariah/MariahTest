//
//  ViewController.swift
//  M
//
//  Created by Mariah Sami Khayat on 2/23/16.
//  Copyright © 2016 Mariah. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {


    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var TextView: UITextView!
    
let ref = Firebase(url:"https://mariahsamikhayat.firebaseio.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        
    

    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(animated: Bool) {
        if ref.authData != nil {
            print("there is a user already signed in")
            self.performSegueWithIdentifier("SignIn", sender: self)
        } else {
            print("You will have to login or sign up")
        }
    }

    
    @IBAction func SignIn(sender: AnyObject) {
        if EmailTextField.text == "" || PasswordTextField.text == ""  {print("make sure to fill in all of all  Text Field")}
        else {
            ref.authUser(EmailTextField.text , password: PasswordTextField.text, withCompletionBlock: { (ErrorType, authData) -> Void in
                if ErrorType != nil {
                    print(ErrorType)
                    print("There is an error with given information")
                } else {
                    print("Login Success")
                    self.performSegueWithIdentifier("SignIn", sender: self)
                    
                }
            })
            
            
        }
        
    }
    
    
    @IBAction func SignUp(sender: AnyObject) {
        if EmailTextField.text == "" || PasswordTextField.text == ""  {print("make sure to enter in each textField")}
        else {
            ref.createUser(EmailTextField.text, password: PasswordTextField.text, withCompletionBlock: { (ErrorType) -> Void in
                if ErrorType != nil {
                    var myError = ErrorType as NSError
                    print(myError)} else {
                    print("Sucess Sign Up")
                    
                    self.ref.authUser(self.EmailTextField.text, password: self.PasswordTextField.text, withCompletionBlock: { (ErrorType, authData) -> Void in
                        if ErrorType != nil {
                            print(ErrorType)
                            print("There is an error with given information")}
                        else {
                            var userId = authData.uid
                            let newUser = [
                                
                                "provider": authData.provider,
                                "email": authData.providerData["email"] as? NSString as? String,
                                "name": self.NameTextField.text ,
                                "about": self.TextView.text
                            ]
                          
                            
                            self.ref.childByAppendingPath("users").childByAppendingPath(authData.uid).setValue(newUser)
                           
                            
                            self.performSegueWithIdentifier("SignIn", sender: self)
                        
                        }
                    })
                }
                
            })
            
        }
    
    }
    
    
}
