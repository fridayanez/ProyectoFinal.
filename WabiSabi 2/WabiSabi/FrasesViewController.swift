//
//  FrasesViewController.swift
//  WabiSabi
//
//  Created by Macbook on 6/6/19.
//  Copyright © 2019 Eduardo Luna. All rights reserved.
//

import UIKit
class FrasesViewController: UIViewController {

    
    @IBOutlet weak var web: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  let url = NSURL (string: "htpps://frasesmotivacion.net");
         let url = NSURL (string: "htpps://google.com");
        let request = NSURLRequest (url: url! as URL);
        web.loadRequest(request as URLRequest)

        // Do any additional setup after loading the view.
    }
    


}
