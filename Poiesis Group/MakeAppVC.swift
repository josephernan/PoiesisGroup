//
//  MakeAppVC.swift
//  docker
//
//  Created by admin on 16/11/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import GoogleSignIn

class MakeAppVC: UIViewController {
    
    @IBOutlet var MakeAppButton: CustomButton!
    @IBOutlet var TherapistsButton: CustomButton!
    @IBOutlet var PaySessionButton: CustomButton!
    @IBOutlet var ImportantInformationButton: CustomButton!

    var data = DoctorData()

     override func viewDidLoad() {
        super.viewDidLoad()

        // Load the doctor data
        self.data.doctorList()
        
        // Set backgroubd color
        self.view.backgroundColor = UIColor( red: 0.9, green: 0.9, blue: 0.9, alpha:1.0 )
    }
    
    // Make an appointment
    @IBAction func MakeAppAct(_ sender: Any) {
        //    Navigation change
         guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectServiceVC_ID") as? SelectServiceVC else {
         return
         }
        
        // send the doctor data
        uvc.data = self.data
        self.navigationController?.pushViewController(uvc, animated: true)
         
    }
    
    //Go to DoctorList Page
    @IBAction func goDoctorList(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "DoctorListVC") as? DoctorListViewController else {
            return
        }

        // send the doctor data
        uvc.data = self.data
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    //Go to PayForSession Page
    @IBAction func goPayForSession(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "PayViewVC") else {
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    //Go to Important Information Page
    @IBAction func goImportantInfo(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "ImportantInfoVC") else {
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
        
    }
    
    @IBAction func goMain(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Are you sure?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            //user logout
            try! Auth.auth().signOut()
            
            self.navigationController?.popViewController(animated: false)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: false, completion: nil)
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }
    
}


