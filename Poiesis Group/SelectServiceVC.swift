//
//  SelectServiceVC.swift
//  docker
//
//  Created by admin on 16/11/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit

class SelectServiceVC: UIViewController {
    
    @IBOutlet var ITButton: CustomButton!
    @IBOutlet var PPButton: CustomButton!
    @IBOutlet var APButton: CustomButton!
    @IBOutlet var CTButton: CustomButton!
    @IBOutlet var FTButton: CustomButton!
    @IBOutlet var CButton: CustomButton!
    
    // doctor data form MakeAppVC
    var data = DoctorData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set backgroubd color
        self.view.backgroundColor = UIColor( red: 0.9, green: 0.9, blue: 0.9, alpha:1.0 )
    }

    // Individual ( index : 0 )
    @IBAction func IndividualTherapyAct(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectDoctorTV_ID") as? SelectDoctorTV else {
            return
        }

        // Check region
        if CheckRegionByService( serviceIndex : 0 ) != 0
        {
            uvc.coast = "60.00"
            uvc.data = data
            uvc.serviceIndex = 0
            self.navigationController?.pushViewController(uvc, animated: true)
        }
    }
    
    // Pediatric ( index : 1 )
    @IBAction func PediatricPsychologyAct(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectDoctorTV_ID") as? SelectDoctorTV else {
            return
        }

        // Check region
        if CheckRegionByService( serviceIndex : 0 ) != 0
        {
            uvc.coast = "60.00"
            uvc.data = data
            uvc.serviceIndex = 1
            self.navigationController?.pushViewController(uvc, animated: true)
        }
    }
    
    // Adolescents ( index : 2 )
    @IBAction func AdolescentsPsychology(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectDoctorTV_ID") as? SelectDoctorTV else {
            return
        }

        // Check region
        if CheckRegionByService( serviceIndex : 0 ) != 0
        {
            uvc.coast = "60.00"
            uvc.data = data
            uvc.serviceIndex = 2
            self.navigationController?.pushViewController(uvc, animated: true)
        }
    }
    
    // Couples ( index : 3 )
    @IBAction func CouplesTherapy(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectDoctorTV_ID") as? SelectDoctorTV else {
            return
        }
        
        // Check region
        if CheckRegionByService( serviceIndex : 0 ) != 0
        {
            uvc.coast = "60.00"
            uvc.data = data
            uvc.serviceIndex = 3
            self.navigationController?.pushViewController(uvc, animated: true)
        }
    }
    
    // Family ( index : 4 )
    @IBAction func FamilyTherapy(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectDoctorTV_ID") as? SelectDoctorTV else {
            return
        }
        
        // Check region
        if CheckRegionByService( serviceIndex : 0 ) != 0
        {
            uvc.coast = "60.00"
            uvc.data = data
            uvc.serviceIndex = 4
            self.navigationController?.pushViewController(uvc, animated: true)
        }
    }
    
    // Coaching ( index : 5 )
    @IBAction func Coaching(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectDoctorTV_ID") as? SelectDoctorTV else {
            return
        }
        
        // Check region
        if CheckRegionByService( serviceIndex : 0 ) != 0
        {
            uvc.coast = "70.00"
            uvc.data = data
            uvc.serviceIndex = 5
            self.navigationController?.pushViewController(uvc, animated: true)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    // region check by service?
    func CheckRegionByService( serviceIndex : Int ) -> Int {
        var indexCount = 0
        for index in 0..<data.doctorDetailList.count
        {
            if data.doctorDetailList[ index ].doctorCityIdx == serviceIndex
            {
                indexCount += 1
            }
        }
        if indexCount == 0
        {
            let alert = UIAlertController(title: nil, message: "No city by " + data.departmentName[serviceIndex], preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style:.cancel, handler: nil ))
        }
        return indexCount
    }
}
