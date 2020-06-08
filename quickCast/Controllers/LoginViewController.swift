//
//  ViewController.swift
//  quickCast
//
//  Created by Malik Adebiyi on 2020-05-23.
//  Copyright © 2020 dotSandbox. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vc = UIViewController()
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        
        mainTabController.selectedViewController = mainTabController.viewControllers?[3]
        
//        present(mainTabController, animated: true, completion: nil)
        
        let vc = mainTabController
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
      
        
        
        
        
    }
    
}

