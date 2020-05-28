//
//  SettingsViewController.swift
//  quickCast
//
//  Created by Malik Adebiyi on 2020-05-24.
//  Copyright © 2020 dotSandbox. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController, UITableViewDataSource {
    
    var settings = ["Edit Profile", "Change Password", "Logout"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        cell.textLabel?.text = settings[indexPath.row]
        
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
         
    }
}
