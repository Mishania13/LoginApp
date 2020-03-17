//
//  ViewController.swift
//  LoginApp
//
//  Created by Mr. Bear on 11.03.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    
    
    var accessData = [
        "Jhon":"Rembo",
        "Konan":"Barbarian",
        "Max":"Mad",
        "user":"password"
    ]
    
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var accessButton: UIButton!
    @IBOutlet var signButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessButton.layer.cornerRadius = 10
        signButton.layer.cornerRadius = 10
        
        
        loginField.placeholder = "Enter login"
        loginField.text = ""
        
        passwordField.placeholder = "Enter password"
        passwordField.isSecureTextEntry = true
        
    }
    
    @IBAction func signUp (_ sender: UIButton?) {
    }
    
    @IBAction func gettingAccess (_ sender: UIButton?) {loginVerification()}
    
    @IBAction func unwindSecondVC (segue: UIStoryboardSegue) {
        
        loginField.text = ""
        passwordField.text = ""
    }
    
    @IBAction func unwindSignUp (segue: UIStoryboardSegue) {
        loginField.text = ""
        passwordField.text = ""
        
    }
    
    @IBAction func unwindAdmin(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SecondViewController {
            destinationVC.login = loginField.text!
        }
        else if let destinationVC = segue.destination as? AdminTable {
            destinationVC.adminData = accessData
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func loginAlert(type: String) {
        let alertController = UIAlertController(title: "Input data error",
                                                message: "You enter wrong \(type)",
            preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    func loginVerification() {
        for (key, value) in accessData {
            if key == "admin" && value == "admin" {
                performSegue(withIdentifier: "Admin", sender: nil)
            }
            else if key == loginField.text && value == passwordField.text {
                performSegue(withIdentifier: "loginSegue", sender: nil)
                break
            } else if key == loginField.text {
                loginAlert(type: "password")
                break
            }
        }
        loginAlert(type: "login and password")
    }
    
    func gettingUserData(userDataDict: [String : String]) {
        return
    }
}

