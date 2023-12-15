//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Vedat Dokuzkardeş on 22.11.2023.
//

import UIKit
import ParseCore

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signinBtn(_ sender: Any) {
        
        if usernameTxt.text != "" && passwordTxt.text != "" {
            
            PFUser.logInWithUsername(inBackground: usernameTxt.text!, password: passwordTxt.text!) { user, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else {
                    //segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(title: "Error", message: "Username / Password ??")
        }
    }
    

    @IBAction func signupBtn(_ sender: Any) {
        
        if usernameTxt.text != "" && passwordTxt.text != "" {
            
            let user = PFUser()
            user.username = usernameTxt.text!
            user.password = passwordTxt.text!
            
            user.signUpInBackground { success, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error!!")
                }else{
                    //segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                    
                    
                }
                
            }
            
        }else{
            makeAlert(title: "Error", message: "Username / Password ??")
            
        }
    }
    
    func makeAlert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

