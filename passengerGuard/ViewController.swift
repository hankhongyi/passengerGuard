//
//  ViewController.swift
//  passengerGuard
//
//  Created by Huang, Hong-Yi (Agoda) on 4/19/2559 BE.
//  Copyright © 2559 Huang, Hong-Yi (Agoda). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var facebookLoginContainer: UIView!
    @IBOutlet weak var loginContainer: UIStackView!
    let mapViewSegue = "mapViewSegue"
    var facebookEngine:FacebookEngine = FacebookEngine.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookEngine.addLoginButton(facebookLoginContainer)
        if(facebookEngine.isFacebookUserLoggedIn()) {
            self.performSegueWithIdentifier(mapViewSegue, sender: nil)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        if(facebookEngine.isUserLoggedIn()) {
//            self.performSegueWithIdentifier(mapViewSegue, sender: nil)
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTestButtonClicked(sender: UIButton) {
        facebookEngine.facebookLogin()
    }

}

