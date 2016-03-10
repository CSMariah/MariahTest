//
//  EditViewController.swift
//  M
//
//  Created by Mariah  3/9/16.
//  Copyright © 2016 Mariah. All rights reserved.
//

import UIKit
import Firebase

class EditViewController: UIViewController {

    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var TextView: UITextView!
    var ref = Firebase(url:"https://mariahsamikhayat.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let ref = Firebase(url:"https://mariahsamikhayat.firebaseio.com/users/\(self.ref.authData.uid)")
       
        ref.observeEventType(.Value, withBlock: { snapshot in
            let e = snapshot.value.objectForKey("email") as? String
            self.EmailTextField.text = e
            print(self.EmailTextField.text)
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            let t = snapshot.value.objectForKey("name") as? String
            self.NameTextField.text = t
            print(self.NameTextField.text)
            }, withCancelBlock: { error in
                print(error.description)
        })
        
     
        ref.observeEventType(.Value, withBlock: { snapshot in
            let a = snapshot.value.objectForKey("about") as? String
            self.TextView.text = a
            print(self.TextView.text)
            }, withCancelBlock: { error in
                print(error.description)
        })
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    

    @IBAction func Done(sender: AnyObject) {
        
         var ref = Firebase(url:"https://mariahsamikhayat.firebaseio.com/users/\(self.ref.authData.uid)")

       ref.changeEmailForUser("email", password: "provider", toNewEmail: EmailTextField.text) { (ErrorType) -> Void in
        
        if ErrorType != nil {
        print("There was an error processing the request")
        } else {
          print("Email changed successfully")
        }
        
        }
        
        
        ref.childByAppendingPath("users/\(self.ref.authData.uid)").updateChildValues(["name":NameTextField.text!])
        ref.childByAppendingPath("users/\(self.ref.authData.uid)").updateChildValues(["about":TextView.text!])

        

   
    }


}
