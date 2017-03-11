//
//  cloudGenerator.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/10/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import Foundation
import SpriteKit

class cloudGenerator:SKSpriteNode{
    let cloudWidth :CGFloat = 125
    let cloudHeight :CGFloat = 55
    
    var genTimer : Timer!
    func populate(num: Int){
        for _ in 0  ..< num  {
            let cloud=cloudClass(size : CGSize(width:cloudWidth,height:cloudHeight))
            let X = CGFloat(arc4random_uniform(UInt32(UInt(size.width)))) - size.width/2
            let Y = CGFloat(arc4random_uniform(UInt32(UInt(size.height)))) - size.height/2
            cloud.position = CGPoint(x: X, y: Y)
            cloud.zPosition = -1
            addChild(cloud)
            
            
        }
        
    }
   // func startGenWithSpanTime(seconds : TimeInterval){
        func startGenWithSpanTime(){
        let x = size.width/2 + cloudWidth/2
        let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
        let cloud = cloudClass(size: CGSize(width: cloudWidth, height: cloudHeight))
        cloud.position = CGPoint(x: x, y: y)
        cloud.zPosition = -1
        addChild(cloud)
        
        
        
    }

}
