//
//  ActionButton.swift
//  quickCast
//
//  Created by Malik Adebiyi on 2020-06-08.
//  Copyright © 2020 dotSandbox. All rights reserved.
//

import UIKit

extension UIButton {

    func createFloationActionButton() {
        backgroundColor = .orange
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.36
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}

class ActionButton {
    
}
