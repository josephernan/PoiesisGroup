//
//  SelectDoctorTV.swift
//  docker
//
//  Created by admin on 16/11/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class SelectDoctorTV : UITableViewController {
    
    // coast
    var coast = ""
    // doctor data form SelectServiceVC
    var data = DoctorData()    
    var serviceIndex = 0
    var cityIndex = [Int]()
    
    // doctor list index by service index
    var doctorIndex = [Int]()
    
    override func viewDidLoad( ) {
        // Get the bit value by service index
        // city check by servisce idx
        // service bit         0             1            2              3          4         5
        // departmentName = [ "individual", "pediatric", "adolescents", "couples", "family", "coaching" ]
        // city name
        // index             0           1          2          3           4        5              6
        // let cityNameList = [ "San Jose", "Cartago", "Heredia", "Alajuela", "Limon", "Guanacaste", "Puntarenas" ]
        var bitValue : UInt8 = 0b00000001
        bitValue = bitValue << serviceIndex
        var cityCount = 0
        
        for index in 0..<self.data.doctorDetailList.count
        {
            let value = self.data.doctorDetailList[ index ].department! & bitValue
            if value != 0
            {
                // If doctor has service index
                doctorIndex.append( index )
                
                // If no the same city
                // 0 - present
                // 1 - no present
                if checkCityIdx( cityIx:self.data.doctorDetailList[ index ].doctorCityIdx! ) == 1
                {
                    cityIndex.append( self.data.doctorDetailList[ index ].doctorCityIdx! )
                    cityCount += 1
                }
            }
        }
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityIndex.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"NameCell") as! NameCell
        
        cell.nameLabel?.text =  self.data.cityNameList[ cityIndex[indexPath.row] ]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("Selcted row is \(indexPath.row).")
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectDoctorDetail_ID") as? SelectDoctorDetailTV else {
            return
        }

        // send doctor only for selected city
        uvc.coast = self.coast
        uvc.data = self.data
        uvc.doctorIndex = self.doctorIndex
        uvc.selectedCityIdx = cityIndex[ indexPath.row ]
        self.navigationController?.pushViewController(uvc, animated: true)
    }

    // check if same index
    // 0 - present
    // 1 - no present
    func checkCityIdx( cityIx:Int ) -> Int
    {
    let count = self.cityIndex.count
    var returnValue = 1
        for idx in 0..<count
        {
            if cityIx == self.cityIndex[ idx ]
            {
                returnValue = 0
                break
            }
        }
        return returnValue
    }
}



