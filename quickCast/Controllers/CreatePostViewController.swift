//
//  CreatePostViewController.swift
//  quickCast
//
//  Created by Malik Adebiyi on 2020-06-11.
//  Copyright © 2020 dotSandbox. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    @IBOutlet weak var cancelBTN: UIButton!
    @IBOutlet weak var textField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.becomeFirstResponder() 
    }
    @IBAction func cancelBTN(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareBTN(_ sender: Any) {
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
