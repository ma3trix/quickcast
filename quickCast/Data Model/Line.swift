//
//  Line.swift
//  quickCast
//
//  Created by Malik Adebiyi on 2020-06-10.
//  Copyright © 2020 dotSandbox. All rights reserved.
//

import UIKit

class Line: UIButton {

   var line = UIBezierPath()
    
    func graph(){
        line.move(to: .init(x: 0, y: 255))
        line.addLine(to: .init(x: bounds.width, y: 255))
        UIColor.orange.setStroke()
        line.lineWidth = 0.3
        line.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        graph()
    }

}
