//
//  MovingGround.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/6/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import Foundation
import SpriteKit

class MovingGround: SKSpriteNode {
    let NUMBER_OF_SEGMENTS = 20
    let COLOR_ONE = UIColor(red: 80/255, green: 150/255, blue: 100/255, alpha: 1.0)
    let COLOR_TWO = UIColor(red: 90/255, green: 165/255, blue: 110/255, alpha: 1.0)
    
    init(size:CGSize) {
        super.init(texture: nil , color: UIColor.brown , size: CGSize(width: size.width*2, height: size.height))
        anchorPoint = CGPoint(x: 0, y: 0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
