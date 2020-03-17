//
//  AdminTable.swift
//  LoginApp
//
//  Created by Mr. Bear on 15.03.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class AdminTable: UITableViewController {

    var adminData: [String : String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.presentationController?.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adminData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminCell", for: indexPath)
        let keys = Array(adminData.keys)
        
        guard let password = adminData[(keys[indexPath.row])] else {return cell}
        cell.textLabel?.text = "Name: \(keys[indexPath.row])" + "\n" + "Password: \(password)"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let keys = Array(adminData.keys)
            adminData.removeValue(forKey: (keys[indexPath.row]))
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "There you can see and delete user data."
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
}

extension AdminTable: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print("dissmised")
    }
}

//protocol UserDataDelegate: class {
//    func gettingUserData (userDataDict: [String:String])
//}
