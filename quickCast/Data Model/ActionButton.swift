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
    
    func pulsate() {
          
          let pulse = CASpringAnimation(keyPath: "transform.scale")
          pulse.duration = 0.5
          pulse.fromValue = 0.75
          pulse.toValue = 1.0
          pulse.autoreverses = true
          pulse.repeatCount = 2
          pulse.initialVelocity = 0.5
          pulse.damping = 1.0
          
          layer.add(pulse, forKey: "pulse")
      }
    
        func flash() {
          
          let flash = CABasicAnimation(keyPath: "opacity")
          flash.duration = 0.5
          flash.fromValue = 1
          flash.toValue = 0.1
          flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
          flash.autoreverses = true
          flash.repeatCount = 3
          
          layer.add(flash, forKey: nil)
      }
      
    
      func shake() {
          
          let shake = CABasicAnimation(keyPath: "position")
          shake.duration = 0.1
          shake.repeatCount = 2
          shake.autoreverses = true
          
          let fromPoint = CGPoint(x: center.x - 5, y: center.y)
          let fromValue = NSValue(cgPoint: fromPoint)
          
          let toPoint = CGPoint(x: center.x + 5, y: center.y)
          let toValue = NSValue(cgPoint: toPoint)
          
          shake.fromValue = fromValue
          shake.toValue = toValue
          
          layer.add(shake, forKey: "position")
      }
}

