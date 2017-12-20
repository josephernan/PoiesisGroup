//
//  ImportantInfoViewController.swift
//  Poiesis Group
//
//  Created by POLARIS on 11/16/17.
//  Copyright © 2017 POLARIS. All rights reserved.
//

import UIKit

class ImportantInfoViewController: UIViewController {
    
    @IBOutlet var display: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set backgroundColor
        self.view.backgroundColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
        
        // Set content of 'Important Information'
        let localfilePath = Bundle.main.url( forResource: "important_info", withExtension: "html" )
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
