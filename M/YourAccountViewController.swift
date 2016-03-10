//
//  YourAccountViewController.swift
//  M
//
//  Created by Mariah Sami Khayat on 2/23/16.
//  Copyright © 2016 Mariah. All rights reserved.
//

import UIKit
import Firebase
class YourAccountViewController: UIViewController {

   
    

    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var TextViewLabel: UITextView!
    
    
    
    var ref = Firebase(url:"https://mariahsamikhayat.firebaseio.com")
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let ref = Firebase(url:"https://mariahsamikhayat.firebaseio.com/users/\(self.ref.authData.uid)")
        ref.observeEventType(.Value, withBlock: { snapshot in
            let m = snapshot.value.objectForKey("email") as? String
            self.EmailLabel.text = m
            print(self.EmailLabel.text)
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            let r = snapshot.value.objectForKey("name") as? String
            self.NameLabel.text = r
            }, withCancelBlock: { error in
                print(self.NameLabel.text)
                print(error.description)
        })
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            let t = snapshot.value.objectForKey("provider") as? String
            self.PasswordLabel.text = t
            print(self.PasswordLabel.text)
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            let t = snapshot.value.objectForKey("about") as? String
            self.TextViewLabel.text = t
            print(self.TextViewLabel.text)
            }, withCancelBlock: { error in
                print(error.description)
        })

    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    

    @IBAction func LogOut(sender: AnyObject) {
        ref.unauth()
        self.performSegueWithIdentifier("LogOut", sender: self)
    }


}
