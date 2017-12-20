//
//  DoctorDetailViewController.swift
//  Poiesis Group
//
//  Created by POLARIS on 11/16/17.
//  Copyright © 2017 POLARIS. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class DoctorDetialViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var doctorIdx : Int = 0
    var data = DoctorData()   
    var param: DoctorInfo?

    @IBOutlet var doctorPhoto: UIImageView!
    @IBOutlet var doctorName: UILabel!
    @IBOutlet var display: UIWebView!
    
    @IBOutlet var makeAppBtn: CustomButton!
    @IBOutlet var chatBtn: CustomButton!
    @IBOutlet var emailBtn: CustomButton!
    @IBOutlet var phoneCallBtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set backgroundColor
        self.view.backgroundColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
        
        // Set photo of 'Doctor'
        self.doctorPhoto.image = param?.doctorPhoto?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 0)
        
        //Set name of 'Doctor'
        self.doctorName.text = param?.doctorName
        
        //Set content of 'Doctor'
        let localfilePath = Bundle.main.url( forResource: param?.doctorInfo, withExtension: "html" )
        let meRequest = URLRequest( url: localfilePath! )
        self.display.loadRequest( meRequest )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // go Make an appointment page
    @IBAction func goMakeApp(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SelectDateVC_ID") as? SelectDateVC else {
            return
        }
        uvc.doctorIndex = self.doctorIdx
        uvc.data = self.data
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    // facebook chat and whats app chat
    @IBAction func Chat(_ sender: Any) {
        let contentVC = ChatButtonViewController()
        contentVC.view.backgroundColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
        let alert = UIAlertController(title: "Which one ?", message: nil, preferredStyle: .alert)
        contentVC.param = self.param
        alert.setValue(contentVC, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: false)
    }
    
    
    // send Email
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @IBAction func SendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([(param?.doctorEmail)!])
        mailComposerVC.setSubject("")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Error", message: "Your device could not send email", preferredStyle: .alert)
        sendMailErrorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // Phone Call
    @IBAction func PhoneCall(_ sender: Any) {
        // Call the local Police department
        guard let number = URL(string: "tel://" + (param?.doctorPhoneNumber)!) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}
