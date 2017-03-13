//
//  Coin.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/13/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

//import Foundation
import SpriteKit

class Coin:SKSpriteNode {
    //let coinWidth:CGFloat = 5.0
    //let coinHeight:CGFloat = 5.0
    let coinColor = UIColor.clear
    
    init(){
        let textures = SKTexture(image: #imageLiteral(resourceName: "coin.png"))
        super.init(texture: textures)
        //super.init(texture: textures)
        
        //startMoving()
        //loadPhysicsBody()
    }
    
    func loadPhysicsBody(){
        
        physicsBody = SKPhysicsBody(circleOfRadius: 25)
        physicsBody?.contactTestBitMask = heroCat
        physicsBody?.categoryBitMask = coinCat
        
        physicsBody?.affectedByGravity = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    func startMoving(){
//        let moveLeft = SKAction.moveBy(x: -320, y: 0, duration: 1)
//        run(SKAction.repeatForever(moveLeft))
//    }
//    
//    func stopMoving(){
//        removeAllActions()
//        
//    }
}
