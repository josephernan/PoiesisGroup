//
//  SelectDoctorTV.swift
//  docker
//
//  Created by admin on 16/11/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class SelectDoctorDetailTV : UITableViewController {
    
    // coast
    var coast = ""
    // doctor data form SelectDoctorTV
    var data = DoctorData()
    var doctorIndex = [Int]()
    
    // doctor index in selected City
    var doctorNewIndex = [Int]()
    var selectedCityIdx = 0
    
    // First excute
    override func viewDidLoad( ) {
        // remove doctor index in selected City outside
        for index in 0..<doctorIndex.count
        {
            if data.doctorDetailList[ doctorIndex[ index ] ].doctorCityIdx == selectedCityIdx
            {
                doctorNewIndex.append( doctorIndex[ index ] )
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.doctorNewIndex.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Load the data for given row
        let row = self.data.doctorDetailList[ doctorNewIndex[ indexPath.row ] ]
        
        // casting type modify as! UITableViewCell => as! DoctorDetailCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorDetailCell") as! DoctorDetailCell
        
        // Set outlet variable the data
        cell.doctorName.text = row.doctorName
        cell.doctorPhoto.image = row.doctorPhoto
        
        // Return the cell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("Selected Row is \(indexPath.row).")
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectDateVC_ID") as? SelectDateVC else {
            return
        }
        
        uvc.coast = self.coast
        uvc.doctorIndex = doctorNewIndex[ indexPath.row ]
        uvc.data = self.data
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
}


