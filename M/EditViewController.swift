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
    
    var ref = Firebase(url:"https://mariahsamikhayat.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Firebase(url:"https://mariahsamikhayat.firebaseio.com/users/\(self.ref.authData.uid)")
        ref.observeEventType(.Value, withBlock: { snapshot in
            let t = snapshot.value.objectForKey("name") as? String
            self.NameTextField.text = t
            print(self.NameTextField.text)
            }, withCancelBlock: { error in
                print(error.description)
        })
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    

    @IBAction func Done(sender: AnyObject) {

        
        ref.childByAppendingPath("users/\(self.ref.authData.uid)").updateChildValues(["name":NameTextField.text!])


        
    }
   
}
