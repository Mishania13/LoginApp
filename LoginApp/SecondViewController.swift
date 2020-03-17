//
//  SecondViewController.swift
//  LoginApp
//
//  Created by Mr. Bear on 11.03.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var login = ""
    
    @IBOutlet var text: UILabel!
    @IBOutlet var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.imageView?.contentMode = .scaleAspectFill
        
        text.text = """
        Congratulation \(login)!
        You log in succsesful.
        Now you can close this
        screen by tapping on
        cross.
        """
    }
    
    
    
    
    
}
