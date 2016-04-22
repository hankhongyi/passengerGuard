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
    override func viewDidLoad() {
        super.viewDidLoad()
        let facebookEngine:FacebookEngine = FacebookEngine()
        facebookEngine.addLoginButton(facebookLoginContainer)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

