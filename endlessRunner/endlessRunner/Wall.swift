//
//  Wall.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/10/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import Foundation
import SpriteKit

class Wall:SKSpriteNode {
    let wallWidth:CGFloat = 30.0
    let wallHeight:CGFloat = 50.0
    let wallColor = UIColor.black
    
    init(){
        super.init(texture: nil, color:wallColor , size: CGSize(width: wallWidth, height: wallHeight))
        startMoving()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func startMoving(){
        let moveLeft = SKAction.moveBy(x: -320, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
}
