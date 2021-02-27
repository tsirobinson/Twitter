//
//  LoginViewController.swift
//  Twitter
//
//  Created by Tyler Robinson on 2/26/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //if user has previously logged in, go directly to home
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        //logging in
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            //create variable called userLoggedIn and set it to true
            //stores login activity in memory
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            //segue to next screen if login was successful
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not authenticate.")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
