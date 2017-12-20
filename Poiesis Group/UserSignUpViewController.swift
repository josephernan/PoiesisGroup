//
//  UserSignUpViewController.swift
//  Poiesis Group
//
//  Created by admin on 11/17/17.
//  Copyright © 2017 psicologosencostarica. All rights reserved.
//

import UIKit
import FirebaseAuth

class UserSignUpViewController: UIViewController {
    @IBOutlet var okSignBtn: CustomButton!
    @IBOutlet var cancelSignBtn: CustomButton!
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPassText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(displayP3Red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0)
        
    }
    
    @IBAction func goSignUpOk(_ sender: Any) {
        
        let validemail = isValidEmail(emailstr: emailText.text!)
        
        /////////////////////////////////////////////////////Handle Exception//////////////////////////////////////////////////////////
        if firstNameText.text == ""{
            viewAlert(message: "Please enter your first name.")
        }
        else if lastNameText.text == ""{
            viewAlert(message: "Please enter your last name.")
        }
        else if emailText.text == "" || validemail == false{
            viewAlert(message: "Please enter your correct email address.")
        }
        else if phoneText.text == ""{
            viewAlert(message: "Please enter your phone number.")
        }
        else if passwordText.text == ""{
            viewAlert(message: "Please enter your password.")
        }
        else if strlen(passwordText.text) < 6{
            viewAlert(message: "Password must be 6 character at least.")
        }
        else if confirmPassText.text == ""{
            viewAlert(message: "Please enter your confirm password.")
        }
        else if passwordText.text != confirmPassText.text{
            viewAlert(message: "Please check your password setting again.")
        }
        else{
            if emailText.text != "" && passwordText.text != ""{
                Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                    if user != nil{
                        
                        print("Firebase SignUp Success")
                        
                        //send verification email to user
                        Auth.auth().languageCode = "es"
                        Auth.auth().currentUser?.sendEmailVerification { (error) in
                            if let error = error{
                                print("send email failed", error)
                                return
                            }
                            
                            //push notification with email verify and go to login page if yes.
                            
                            let alert = UIAlertController(title: nil, message: "SignUp success! Please check your email and try LogIn", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
                                self.navigationController?.popViewController(animated: false)
                            })
                            self.present(alert, animated: false, completion: nil)
                        }
                        
                    }
                    else{
                        print(error?.localizedDescription as Any)
                        
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func goCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //show alert with exception
    func viewAlert(message: String) -> Void {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        return
    }
    
    //validate email
    func isValidEmail(emailstr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailstr)
    }
    
}

