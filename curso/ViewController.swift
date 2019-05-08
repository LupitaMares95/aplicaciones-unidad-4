//
//  ViewController.swift
//  curso
//
//  Created by LABMAC03 on 02/05/19.
//  Copyright © 2019 LABMAC03. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class ViewController: UIViewController {
   var ref = DatabaseReference.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginAnony()
        self.ref = Database.database().reference()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //
    func loginAnony() {
      Auth.auth().signInAnonymously(){
           (user, error) in
            //code here
            
           if let error = error {
              print("Cannot login: \(error)")
          }else{
            print("user UID \(String(describing: user?.user))")
            }

        }

   }
    
    
    
    
    

}

