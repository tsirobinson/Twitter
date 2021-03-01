//
//  TweetViewController.swift
//  Twitter
//
//  Created by Tyler Robinson on 3/1/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //displays keyboard over text view when we load this view
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    @IBAction func cancel(_ sender: Any) {
        //go back/undo navigation
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        //cannot tweet if the text view is empty
        if(!tweetTextView.text.isEmpty){
            //call our tweet function from the api caller class and go back
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                //display error and go back
                print("Error posting tweet: \(error).")
                self.dismiss(animated: true, completion: nil)
            })
        }else{
            //go back
            self.dismiss(animated: true, completion: nil)
        }
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
