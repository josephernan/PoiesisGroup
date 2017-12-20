//
//  ViewController.swift
//  Poiesis Group
//
//  Created by admin on 11/15/17.
//  Copyright © 2017 psicologosencostarica. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import GoogleSignIn
import FBSDKLoginKit

class MainViewController: UIViewController, GIDSignInUIDelegate, FBSDKLoginButtonDelegate {
    
    @IBOutlet var logoImg: UIImageView!
    @IBOutlet var loginBtn: CustomButton!
    @IBOutlet var signupBtn: CustomButton!
    @IBOutlet var contactBtn: CustomButton!
    @IBOutlet var aboutBtn: CustomButton!
    @IBOutlet var fbloginBtn: FBSDKLoginButton!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set background color
        self.view.backgroundColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
        self.logoImg.image = UIImage(named: "logo_white.png")
        self.loading.isHidden = true
        
        //Add Google LogIn Button
        
        GIDSignIn.sharedInstance().uiDelegate = self
        signInButton.style = GIDSignInButtonStyle.wide
        
        fbloginBtn.delegate = self
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("Firebase login failed!", error)
                return
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MakeAppVC_ID") as? MakeAppVC
            self.navigationController?.pushViewController(vc!, animated: false)
            print("logged in")
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //login process
    @IBAction func doLogIn(_ sender: Any) {
        self.loading.isHidden = false
        self.loading.startAnimating()
        Auth.auth().signIn(withEmail: mailText.text!, password: passText.text!) { (user, error) in
            if user != nil{
                
                if let user = Auth.auth().currentUser {
                    if !user.isEmailVerified{
                        let alert = UIAlertController(title: "Error", message: "Sorry. Your email address has not yet been verified. Please check your email for verification", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true)
                        self.loading.stopAnimating()
                        self.loading.isHidden = true
                        return
                    } else {
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MakeAppVC_ID") as? MakeAppVC
                        self.navigationController?.pushViewController(vc!, animated: false)
                        self.loading.stopAnimating()
                        self.loading.isHidden = true
                        print ("Email verified. Signing in...")
                        print("Firebase Login Success")
                    }
                }
            }
            else{
                print(error?.localizedDescription as Any)
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                self.loading.stopAnimating()
                self.loading.isHidden = true
            }
        }
        
    }
    
    //Go to Contact us Page
    @IBAction func goContactUs(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsVC") as? ContactUsViewController
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    //Go to AboutUs Page
    @IBAction func goAboutUs(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsVC") as? AboutUsViewController
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    //Go to SignUp Page
    @IBAction func goSignUp(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else {
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
}

