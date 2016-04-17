//
//  ViewController.swift
//  firebasesample
//
//  Created by Vineeth Vijayan on 08/04/16.
//  Copyright © 2016 Vineeth Vijayan. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a reference to a Firebase location
        let ref = Firebase(url:"https://vivid-heat-4361.firebaseio.com/messages")
        
        ref.queryOrderedByChild("text").queryEqualToValue("Just a message")
            .observeEventType(.ChildAdded, withBlock: { snapshot in
                print(snapshot.value)
                print(snapshot.value.objectForKey("sender"))
                print(snapshot)
            })
        
        // Write data to Firebase
//        myRootRef.setValue("Do you have data? You'll love Firebase. ABC DEF")
//        let alanisawesome = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
//        let gracehop = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]
//        let vin = ["full_name": "vin vin", "date_of_birth": "December 9, 1906"]
//        
//        let usersRef = ref.childByAppendingPath("users")
//        
//        let users = ["vin": vin]
//        usersRef.updateChildValues(users)
//        usersRef.setValue(users)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

