//
//  ProfileViewController.swift
//  quickCast
//
//  Created by Malik Adebiyi on 2020-05-24.
//  Copyright © 2020 dotSandbox. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let userGIF:[String] = ["1", "2", "3", "4","5", "6","7", "8","9", "10","11", "12","13", "14","15", "16","17", "18","19","20","21","22","23","24"]
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var gifCollectionView: UICollectionView!
    @IBOutlet weak var actionBTN: UIButton!
    @IBOutlet weak var EditProfile: UIButton!
    @IBAction func EditProfleBTN(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        EditProfile.layer.borderColor = UIColor.orange.cgColor
        EditProfile.layer.borderWidth = 1.5
        EditProfile.layer.cornerRadius = EditProfile.frame.size.width  / 31.69
        profileImage.loadGif(name: "3")
        //layout based on width of the screen
        let itemSize = UIScreen.main.bounds.width/3 - 3
        
        //define new layout
        let layout = UICollectionViewFlowLayout()
        //set margins
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        //define spacing between image
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        
        // add layout to collection view
        gifCollectionView.collectionViewLayout = layout
        
        //MARK: - Action Button
        actionBTN.createFloationActionButton()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return userGIF.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! GifCell
        cell.gifView.image = UIImage(named: userGIF[indexPath.row] + ".gif")
        
        return cell
    }
    

}

