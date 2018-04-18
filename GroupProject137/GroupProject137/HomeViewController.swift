//
//  HomeViewController.swift
//  GroupProject137
//
//  Created by Andrew Kyu on 4/17/18.
//  Copyright © 2018 John Tumath. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "goToSignIn", sender: self)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
