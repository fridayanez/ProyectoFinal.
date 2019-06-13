//
//  ViewController.swift
//  WabiSabi
//
//  Created by Eduardo Luna on 14/05/19.
//  Copyright © 2019 Eduardo Luna. All rights reserved.
//

import UIKit
import FirebaseUI


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func loggin(_ sender: UIButton) {
    
    let authUI = FUIAuth.defaultAuthUI()
    
    guard authUI != nil else {
        return
    
    }
        
    authUI?.delegate = self
    authUI?.providers = [FUIEmailAuth()]
    
    let authViewController = authUI!.authViewController()
    
    present(authViewController, animated: true, completion: nil)
    }
    
}


extension ViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        // Check for error
        guard error == nil else {
            return
        }
        
        // Transition to home
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
}
