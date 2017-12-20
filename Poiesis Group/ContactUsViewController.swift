//
//  ContactUsViewController.swift
//  Poiesis Group
//
//  Created by POLARIS on 11/17/17.
//  Copyright © 2017 POLARIS. All rights reserved.
//

import UIKit
import MessageUI

class ContactUsViewController: UIViewController, MFMailComposeViewControllerDelegate{
    
    @IBOutlet var Photo: UIImageView!
    @IBOutlet var chatBtn: CustomButton!
    @IBOutlet var emailBtn: CustomButton!
    @IBOutlet var phoneCallBtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set backgroundColor
        self.view.backgroundColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
        
        // Set photo of 'Doctor'
        self.Photo.image = UIImage(named: "logo.png")?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // facebook chat and whats app chat
    @IBAction func Chat(_ sender: Any) {
        let contentVC = ChatButtonViewController()
        contentVC.view.backgroundColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
        let alert = UIAlertController(title: "Which one ?", message: nil, preferredStyle: .alert)
        contentVC.param = nil
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
        mailComposerVC.setToRecipients(["contacto@psicologosencostarica.com"])
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
        guard let number = URL(string: "tel://" + "+50622715200") else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}
