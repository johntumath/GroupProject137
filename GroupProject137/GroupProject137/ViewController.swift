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
    
    @IBAction func logOutButton(_ sender: Any) {
        
       
    }
    
    
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
        
        if let email = emailTextField.text, let pass = passwordTextField.text{
            //Check if it's sign in or register
            if isSignIn{
                //Sign in the user with FireBase
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user{
                        //User is found, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }else{
                        //Error, check error
                    }
                })
            }else{
                //Register the user with FireBase
                
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    //Check that user isn't nil
                    if let u = user{
                        self.sendVerification()
                        //User is found, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }else{
                        //Error: check error and show message
                        
                    }
                })
            }
            
        }
    }
    
    func sendVerification(){
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                print("Error: \(String(describing: error!.localizedDescription))")
                return
            }
            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                if error != nil{
                    let emailNOTSentAlert = UIAlertController(title: "Email Verfication", message: "Verification email failed to send: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                    emailNOTSentAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                    self.present(emailNOTSentAlert, animated: true, completion: nil)
                }else{
                    let emailSentAlert = UIAlertController(title: "Email Verification", message: "Verification email has been sent. Please tap the link in the email to verify your account before you can use the features in the app", preferredStyle: .alert)
                    emailSentAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(emailSentAlert, animated: true, completion: {
                        self.dismiss(animated: true, completion: nil)
                    })
                }
                do {
                    try Auth.auth().signOut()
                }catch{
                    //Error handling
                }
            })
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Dismiss the keyboard when the view is tapped on
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
}

