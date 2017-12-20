//
//  SelectDate.swift
//  Doctor
//
//  Created by POLARIS on 11/18/17.
//  Copyright © 2017 POLARIS. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Alamofire

class SelectDateVC: UIViewController {
    // coast
    var coast = ""
    
    // selected doctor
    var data = DoctorData()
    var doctorIndex:Int = 0
    
    // date formatter
    var dateFormatter: DateFormatter!
    // pre date change ago
    var preYearStr:String = ""
    var preHourStr:String = ""
    var preMinuteStr:String = ""
    var preAPStr:String = ""
    
    @IBOutlet var sendButton: CustomButton!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    

    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        // assign date to label when date picker value changed
        // data format :  November 12, 2017 at 8:55 PM
        var dateString = self.dateFormatter.string(from: sender.date)
        var yearStr:String = ""
        var hourStr:String = ""
        var minuteStr:String = ""
        var apStr:String = ""
        ( yearStr, hourStr, minuteStr, apStr ) = StringToDate_Time( dateStr: dateString )
        
        // If the minute is not 0, check
        if minuteStr != "00"
        {
            
            // create controller with style as Alert
            let alertCtrl = UIAlertController(title: "", message: "Can't set the minute.", preferredStyle: UIAlertControllerStyle.alert )
            
            // create button action
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            
            // add action to controller
            alertCtrl.addAction(okAction)
            
            // show alert
            self.present(alertCtrl, animated: true, completion: nil)
            
            
            let gregorian = Calendar( identifier: .gregorian )
            var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: sender.date )
            components.minute = 0
            components.second = 0
            let date = gregorian.date( from: components )
            self.datePicker.date = date!
            dateString = dateFormatter.string(from: sender.date)
            ( yearStr, hourStr, minuteStr, apStr ) = self.StringToDate_Time( dateStr: dateString )
        }
        
        // Save the date
        self.preYearStr = yearStr
        self.preHourStr = hourStr
        self.preMinuteStr = minuteStr
        self.preAPStr = apStr
        
        self.yearLabel.text = yearStr
        self.timeLabel.text = hourStr + ":" + minuteStr + ":" + apStr
    
        CheckEventPossible()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        CheckEventPossible()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set current date ( minute : 0, Second : 0 )
        let gregorian = Calendar( identifier: .gregorian )
        let now = Date()
        var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
        components.minute = 0
        components.second = 0
        let date = gregorian.date( from: components )
        self.datePicker.date = date!
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.timeStyle = DateFormatter.Style.short
        let dateString = self.dateFormatter.string(from: self.datePicker.date)
        var yearStr:String = ""
        var hourStr:String = ""
        var minuteStr:String = ""
        var apStr:String = ""
        ( yearStr, hourStr, minuteStr, apStr ) = StringToDate_Time( dateStr: dateString )
        
        // Save the date
        self.preYearStr = yearStr
        self.preHourStr = hourStr
        self.preMinuteStr = minuteStr
        self.preAPStr = apStr
        
        self.yearLabel.text = yearStr
        self.timeLabel.text = hourStr + ":" + minuteStr + ":" + apStr
        
    }

    // Check event possible?
    func CheckEventPossible() {
        self.sendButton.isEnabled = false
        // the same time request check?
        let dateString_v = self.datePicker.date.addingTimeInterval( -3600 * 6 )
        let myString_v = (String(describing: dateString_v))
        let tutc = utcTOtutc( dateStr : myString_v )
        let doctor_nr = self.doctorIndex + 1
        let urlStr = "https://www.psicologosencostarica.com/google_calendar/mobile_support/event_get.php"
        let parameters: Parameters = ["doctor_num": String(doctor_nr), "time_start": tutc]
            print( urlStr + "?" + "doctor_num=" + String(doctor_nr) + "&time_start=" + tutc )

        Alamofire.request( urlStr, method: .get, parameters: parameters ).responseString() { response in
            let error = response.result.error
            if (error as? AFError) != nil {
                print("Underlying error!")
                self.showAlert( title: "Network Error", message: "Underlying error!" )
            } else if (error as? URLError) != nil {
                print("URLError occurred!")
                self.showAlert( title: "Network Error", message: "URLError occurred!" )
            } else {
                let value = response.result.value!
                print( value )
                if value == "1"
                {
                    self.sendButton.isEnabled = false
                }
                else{
                    self.sendButton.isEnabled = true
                }
            }
        }
    }
    
    // String to Date, Time
    // data format :  November 12, 2017 at 8:55 PM
    // out: date, hour, minute, AP
    func StringToDate_Time( dateStr:String )-> (String,String,String,String) {
        
        // Get the date
        var yearStr = ""
        var idx = 0
        for i in 0..<dateStr.count
        {
            yearStr.append(
                dateStr[dateStr.index(dateStr.startIndex, offsetBy: i )])
            if
                dateStr[dateStr.index(dateStr.startIndex, offsetBy: i+1 )] == " " &&
                    dateStr[dateStr.index(dateStr.startIndex, offsetBy: i+2 )] == "a" &&
                    dateStr[dateStr.index(dateStr.startIndex, offsetBy: i+3 )] == "t"
            {
                idx = i + 4
                break
            }
        }
        
        // Get the hour
        var hourStr = ""
        for i in idx..<dateStr.count
        {
            hourStr.append(
                dateStr[dateStr.index(dateStr.startIndex, offsetBy: i )])
            if dateStr[dateStr.index(dateStr.startIndex, offsetBy: i+1 )] == ":"
            {
                idx = i + 2
                break
            }
        }
        
        // Get the minute
        var minuteStr = ""
        for i in idx..<dateStr.count
        {
            minuteStr.append(
                dateStr[dateStr.index(dateStr.startIndex, offsetBy: i )])
            if dateStr[dateStr.index(dateStr.startIndex, offsetBy: i+1 )] == " "
            {
                idx = i + 1
                break
            }
        }
        
        // Get the AP
        var apStr = ""
        for i in idx..<dateStr.count
        {
            apStr.append(
                dateStr[dateStr.index(dateStr.startIndex, offsetBy: i )])
        }
        
        return (yearStr, hourStr, minuteStr, apStr )
        
    }
    
    // UTC to transmition format
    // inp: yyyy-mm-dd hh:mm:ss +0000
    // out: yyyy-mm-ddThh:00:00
    func utcTOtutc( dateStr:String )-> String {
        // Get the date
        var tutc = ""
        var idx = 0
        for i in 0..<dateStr.count
        {
            tutc.append(
                dateStr[dateStr.index(dateStr.startIndex, offsetBy: i )])
            if dateStr[dateStr.index(dateStr.startIndex, offsetBy: i+1 )] == " "
            {
                idx = i + 2
                break
            }
        }
        tutc.append( "T" )
        
        // Get the hour
        for i in idx..<dateStr.count
        {
            tutc.append(
                dateStr[dateStr.index(dateStr.startIndex, offsetBy: i )])
            if dateStr[dateStr.index(dateStr.startIndex, offsetBy: i+1 )] == ":"
            {
                break
            }
        }
        tutc.append( ":00:00" )
        
        return tutc
        
    }

    // 'Send' button press Process
    @IBAction func SendBtnAction(_ sender: Any) {
        
        //title
        let title = self.data.doctorDetailList[ self.doctorIndex ].doctorName!
        
        let alert = UIAlertController(title: nil, message: "Are you sure to make appointment with " + title + "?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            
            //location
            let location = self.data.cityNameList[ self.data.doctorDetailList[ self.doctorIndex ].doctorCityIdx!] + "," +
                self.data.doctorDetailList[ self.doctorIndex ].doctorAdress!
            
            //Set start datetime and end datetime from UIDatePicker
            
            let dateString = self.datePicker.date.addingTimeInterval( -3600 * 6 )
            let myString = (String(describing: dateString))
            let start_time = self.utcTOtutc( dateStr : myString )
            
            let dateString_end = self.datePicker.date.addingTimeInterval( -3600 * 5 )
            let myString_end = (String(describing: dateString_end))
            let end_time = self.utcTOtutc( dateStr : myString_end )
            
            //doctor email
            let doctor_email = self.data.doctorDetailList[ self.doctorIndex ].doctorEmail!
            
            //patient email
            let pat_email = Auth.auth().currentUser?.email
            //id
            let doctor_id = self.doctorIndex + 1
            let urlStr = "https://www.psicologosencostarica.com/google_calendar/mobile_support/event_send.php"
            let parameters: Parameters = ["id": doctor_id, "t": title, "loc": location, "e1": pat_email!, "e2": doctor_email, "t1": start_time, "t2": end_time ]
            //let final_url_str = url_str.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed )
            Alamofire.request( urlStr, method: .get, parameters: parameters ).responseString() { response in
                let value = response.result.value!
                if value == "invite_success"
                {
                    // go to pay screen
                    guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "PayViewVC") as? PayForSession else {
                        return
                    }
                    
                    uvc.cost = self.coast
                    // send doctor only for selected city
                    self.navigationController?.pushViewController(uvc, animated: true)
                }
            }
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: false, completion: nil)
        
        
    }
   
    // Helper for showing an alert
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
  
    
}
