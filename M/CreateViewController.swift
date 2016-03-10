//
//  CreateViewController.swift
//  M
//
//  Created by Mariah Sami Khayat on 2/23/16.
//  Copyright © 2016 Mariah. All rights reserved.
//

import UIKit
import Firebase

class CreateViewController: UIViewController {

   
    @IBOutlet weak var NameTextField: UITextField!
    
    
let ref = Firebase (url:"https://mariahsamikhayat.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    
    
    @IBAction func Create(sender: AnyObject) {

       
        ref.childByAppendingPath("users/\(ref.authData.uid)/Name").childByAutoId().setValue(NameTextField.text)
             self.performSegueWithIdentifier("Create", sender: self)

    }

   

}
