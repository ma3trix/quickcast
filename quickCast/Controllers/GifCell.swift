//
//  GifCell.swift
//  quickCast
//
//  Created by Malik Adebiyi on 2020-06-07.
//  Copyright © 2020 dotSandbox. All rights reserved.
//

import UIKit

class GifCell: UICollectionViewCell {
    
    let userGIF:[String] = ["1", "2", "3", "4","5", "6","7", "8","9", "10","11", "12","13", "14","15", "16","17", "18","19","20","21","22","23","24"]

    @IBOutlet weak var gifView: UIImageView!
    
    func viewDidLoad() {
        gifView.loadGif(name: "1")
        
        

        
    }
   
}
