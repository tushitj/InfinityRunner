//
//  GameScene.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/6/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 150/250, green: 200/250, blue: 244/255, alpha: 1.90)
        
        
        let ground = SKSpriteNode(color: .red, size: CGSize(width :view.frame.size.width , height : 20))
        
        ground.position = view.center
        addChild(ground)

    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
