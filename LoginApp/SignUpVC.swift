//
//  SignUpVC.swift
//  LoginApp
//
//  Created by Mr. Bear on 15.03.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet var popUpWindow: UIView!
    
    @IBOutlet var okButton: UIButton!
    @IBOutlet var cancleButton: UIButton!
    
    @IBOutlet var text1: UITextField!
    @IBOutlet var text2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpWindow.layer.cornerRadius = 10
        popUpWindow.backgroundColor = #colorLiteral(red: 0.5044671893, green: 0.6787968278, blue: 0.6547230482, alpha: 1)
        popUpWindow.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        popUpWindow.layer.borderWidth = 1
        
        buttonsStyle(button: okButton)
        buttonsStyle(button: cancleButton)
        okButton?.layer.maskedCorners = .layerMinXMaxYCorner
        cancleButton.layer.maskedCorners = .layerMaxXMaxYCorner
        
        text1.placeholder = "Login"
        text2.placeholder = "Password"
        text2.isSecureTextEntry = true
        text1.text = ""
        text2.text = ""
    }
    
    func signUpAlert(_ type: String) {
        let alertController = UIAlertController(title: "Input data error",
                                                message: "You enter to short \(type)",
            preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    @IBAction func tapOk (_ sender: UIButton!) {
        if text1.text!.count < 3 && text2.text!.count < 5 {
            signUpAlert("login and password")
        } else if text2.text!.count < 5 {signUpAlert("password")
        } else if text1.text!.count < 3 {signUpAlert("login")
        } else {
            
            let sucssesSign = UIAlertController(title: "New user added",
                                                     message: "You sign up sucssesful",
                                                     preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default) {
                (action: UIAlertAction!) in
                self.performSegue(withIdentifier: "signUpClose", sender: nil)
            }
            sucssesSign.addAction(okButton)
            present(sucssesSign, animated: true)
            
        }
    }
    
        @IBAction func tapCancel (_ sender: UIButton!) {
            text1.text = ""
            text2.text = ""
           
            performSegue(withIdentifier: "signUpClose", sender: nil)
        }

func buttonsStyle (button: UIButton?) {
    button?.layer.borderWidth = 0.5
    button?.backgroundColor = popUpWindow.backgroundColor
    button?.titleLabel?.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    button?.layer.cornerRadius = 10
    button?.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}
