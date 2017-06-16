//
//  WallGenerator.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/10/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//
import Foundation
import SpriteKit
class WallGenerator:SKSpriteNode {
    var generationTimer : Timer!
    var walls = [Wall]()
    func startGeneratingWall(seconds : TimeInterval){
        generationTimer = Timer.scheduledTimer(timeInterval: seconds,target: self , selector:#selector(WallGenerator.generatedWall) ,userInfo:nil , repeats: true)
    }
    func stopGenerating(){
        generationTimer.invalidate()
    }
    func generatedWall(){
        var scale:CGFloat
        let rand = arc4random_uniform(2)
        if rand == 0 {
            scale = -1.0
        }
        else{
            scale = 1.0
        }
        let wall = Wall()
        wall.position.x = size.width/2 + wall.size.width/2
        wall.position.y = scale * (10 + wall.size.height/2)
        if scale == -1.0{
            wall.zRotation = CGFloat(-M_PI)
        }
        walls.append(wall)
        addChild(wall)
    }
    func flip(){
        //let translate = SKAction.moveBy(x: 0, y: scale*(size.height + 20), duration: 1)
        let flip = SKAction.scaleY(to: -1, duration: 1)
        //run(translate)
        run(flip)
    }
    func stopWalls(){
        stopGenerating()
        for wall in walls {
            wall.stopMoving()
        }
    }
}
