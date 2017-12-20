//
//  TransferViewController.swift
//  Poiesis Group
//
//  Created by admin on 12/13/17.
//  Copyright © 2017 psicologosencostarica. All rights reserved.
//

import UIKit

class TransferViewController: UIViewController {

    @IBOutlet var display: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set backgroudColor
        self.view.backgroundColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
        
        // Set content of 'About us'
        let localfilePath = Bundle.main.url( forResource: "bank_info", withExtension: "html" )
        let meRequest = URLRequest( url: localfilePath! )
        self.display.loadRequest( meRequest )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }

}
