//
//  ViewController.swift
//  GroupProject137
//
//  Created by John Tumath on 2/20/18.
//  Copyright © 2018 John Tumath. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var isSignIn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        //Flipping the boolean
        isSignIn = !isSignIn
        
        //Check the bool and set the button and labels
        if isSignIn{
            signInLabel.text = "Sign In"
            loginButton.setTitle("Sign In", for: .normal)
        }else{
            signInLabel.text = "Register"
            loginButton.setTitle("Register", for: .normal)
        }
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        //Check if it's sign in or register
        if isSignIn{
            //Sign in the user with FireBase
        }else{
            //Register the user with FireBase
        }
    }

}

