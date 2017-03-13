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
    let wallWidth:CGFloat = 35.0
    let wallHeight:CGFloat = 55.0
    let wallColor = UIColor.clear
    
    init(){
        let textures = SKTexture(image: #imageLiteral(resourceName: "tree.png"))
        super.init(texture: textures, color:wallColor , size: CGSize(width: wallWidth, height: wallHeight))
        startMoving()
        loadPhysicsBody(size: CGSize(width: wallWidth, height: wallHeight))
    }
    func loadPhysicsBody(size: CGSize){
        
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.contactTestBitMask = heroCat
        physicsBody?.affectedByGravity = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func startMoving(){
        let moveLeft = SKAction.moveBy(x: -320, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    func stopMoving(){
        removeAllActions()
        
    }
}
