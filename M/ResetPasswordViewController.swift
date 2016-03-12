//
//  ResetPasswordViewController.swift
//  M
//
//  Created by Mariah Sami Khayat on 3/10/16.
//  Copyright © 2016 Mariah. All rights reserved.
//

import UIKit
import Firebase
class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    
     let ref = Firebase(url:"https://sns-imessage.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func ResetPassword(sender: AnyObject) {
    
      ref.resetPasswordForUser(EmailTextField.text) { (ErrorType) -> Void in
        if ErrorType != nil {
            print(ErrorType)
            print("There was an error processing the request")
        } else {
            print("Password reset sent successfully")
        self.performSegueWithIdentifier("ResetPassword", sender: self)
        }
    }
    
    }

}

