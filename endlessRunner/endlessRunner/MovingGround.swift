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
    let COLOR_ONE = UIColor(red: 88/255, green: 148/255, blue: 87/255, alpha: 1.0)
    let COLOR_TWO = UIColor(red: 120/255, green: 195/255, blue: 118/255, alpha: 1.0)
    init(size:CGSize) {
        super.init(texture: nil , color: UIColor.brown , size: CGSize(width: size.width*2, height: size.height))
        anchorPoint = CGPoint(x: 0, y: 0.5)
        for i in 0..<NUMBER_OF_SEGMENTS {
            var segmentColor : UIColor!
            if i%2 == 0 {
                segmentColor=COLOR_ONE
            }
            else{
                segmentColor=COLOR_TWO
            }
            let segment=SKSpriteNode(color: segmentColor, size: CGSize(width: self.size.width/20, height: self.size.height))
            segment.anchorPoint=CGPoint(x: 0, y: 0.5)
            segment.position = CGPoint(x:CGFloat(i)*segment.size.width, y: 0)
            addChild(segment)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func start(){
        let adjust=TimeInterval( frame.size.width/defaultMoveToX)
        let moveleft = SKAction.moveBy(x: -frame.size.width/2, y: 0, duration: adjust/2)
        let resetPosition = SKAction.moveTo(x: 0, duration: 0)
        let moveSequence = SKAction.sequence([moveleft,resetPosition])
        // run(moveleft)
        run(SKAction.repeatForever(moveSequence))
    }
    func stop(){
        removeAllActions()
    }
}
