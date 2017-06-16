//
//  Points.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/13/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//
import Foundation
import UIKit
import SpriteKit
class Points : SKLabelNode{
    var number = 0
    init(num: Int){
        super.init()
        fontColor = UIColor.black
        fontName = "Helvetica"
        fontSize = 20.0
        number = num
        text = "\(num)"
    }
    func setTo(number : Int){
        self.number = number
        text = "\(self.number)"
    }
    func incrementPoints(){
        number += 1
        text = "\(number)"
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
