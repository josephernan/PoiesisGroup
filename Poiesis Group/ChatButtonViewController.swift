//
//  ChatButtonViewController.swift
//  Poiesis Group
//
//  Created by POLARIS on 11/17/17.
//  Copyright © 2017 POLARIS. All rights reserved.
//

import UIKit

class ChatButtonViewController: UIViewController {
    
    let facebookChat = UIButton()
    let whatsAppChat = UIButton()
    var param: DoctorInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.facebookChat.frame = CGRect(x: 0, y: 0, width: 160, height: 30)
        self.facebookChat.center = CGPoint(x: 135, y: 30)
        self.facebookChat.setBackgroundImage(UIImage(named: "btn_bk")?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.facebookChat.setBackgroundImage(UIImage(named: "btn_bk2")?.withRenderingMode(.alwaysOriginal), for: .highlighted)
        self.facebookChat.setTitle("Facebook Chat", for: .normal)
        self.facebookChat.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        self.facebookChat.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(self.facebookChat)
        facebookChat.addTarget(self, action: #selector(fbBtnOnClick(_:)), for: .touchUpInside)
        
        self.whatsAppChat.frame = CGRect(x: 0, y: 0, width: 160, height: 30)
        self.whatsAppChat.center = CGPoint(x: 135, y: 70)
        self.whatsAppChat.setBackgroundImage(UIImage(named: "btn_bk")?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.whatsAppChat.setBackgroundImage(UIImage(named: "btn_bk2")?.withRenderingMode(.alwaysOriginal), for: .highlighted)
        self.whatsAppChat.setTitle("WhatsApp Chat", for: .normal)
        self.whatsAppChat.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        self.whatsAppChat.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(self.whatsAppChat)
        whatsAppChat.addTarget(self, action: #selector(whatsAppBtnOnClick(_:)), for: .touchUpInside)
        
        self.preferredContentSize = CGSize(width: self.view.frame.width, height: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Connect facebook Chat
    @objc func fbBtnOnClick(_ sender: Any) {
        if self.param == nil {
            let fbUrl = "fb-messenger://user/214735575232790"
            if let urlString = fbUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                if let fbURL = NSURL(string: urlString) {
                    if UIApplication.shared.canOpenURL(fbURL as URL) {
                        UIApplication.shared.open(fbURL as URL, options: [:], completionHandler: nil)
                    } else {
                        let alert = UIAlertController(title: nil, message: "Please Install Facebook Messenger", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
                            let appStoreURL = URL(string: "http://itunes.apple.com/us/app/messenger/id454638411?mt=8")!
                            if UIApplication.shared.canOpenURL(appStoreURL) {
                                UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
                            }
                        })
                        self.present(alert, animated: false, completion: nil)
                    }
                }
            }
        } else {
            let fbUrl = "fb-messenger://user/" + (param?.doctorFacebookId)!
            if let urlString = fbUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                if let fbURL = NSURL(string: urlString) {
                    if UIApplication.shared.canOpenURL(fbURL as URL) {
                        UIApplication.shared.open(fbURL as URL, options: [:], completionHandler: nil)
                    } else {
                        let alert = UIAlertController(title: nil, message: "Please Install Facebook Messenger", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
                            let appStoreURL = URL(string: "http://itunes.apple.com/us/app/messenger/id454638411?mt=8")!
                            if UIApplication.shared.canOpenURL(appStoreURL) {
                                UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
                            }
                        })
                        self.present(alert, animated: false, completion: nil)
                    }
                }
            }
        }

    }
    
    // Connect whatsApp Chat
    @objc func whatsAppBtnOnClick(_ sender: Any) {
        
        if self.param == nil {
            let whatsUrl = "whatsapp://send?phone=+50688257991"
            if let urlString = whatsUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                if let whatsappURL = NSURL(string: urlString) {
                    if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                        UIApplication.shared.open(whatsappURL as URL, options: [:], completionHandler: nil)
                    } else {
                        let alert = UIAlertController(title: nil, message: "Please Install WhatsApp Messenger", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
                            let appStoreURL = URL(string: "http://itunes.apple.com/us/app/whatsapp-messenger/id310633997?mt=8")!
                            if UIApplication.shared.canOpenURL(appStoreURL) {
                                UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
                            }
                        })
                        self.present(alert, animated: false, completion: nil)
                    }
                }
            }
        } else {
            let whatsUrl = "whatsapp://send?phone=" + (param?.doctorWhatsApp)!
            if let urlString = whatsUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                if let whatsappURL = NSURL(string: urlString) {
                    if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                        UIApplication.shared.open(whatsappURL as URL, options: [:], completionHandler: nil)
                    } else {
                        let alert = UIAlertController(title: nil, message: "Please Install WhatsApp Messenger", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
                            let appStoreURL = URL(string: "http://itunes.apple.com/us/app/whatsapp-messenger/id310633997?mt=8")!
                            if UIApplication.shared.canOpenURL(appStoreURL) {
                                UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
                            }
                        })
                        self.present(alert, animated: false, completion: nil)
                    }
                }
            }
        }
        
    }

}
