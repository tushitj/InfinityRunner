//
//  cloud.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/10/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import Foundation
import SpriteKit

class cloudClass : SKShapeNode{
    init(size: CGSize){
       super.init()
        //let layer = CGLayer!
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: size.width, height:size.height) , transform: nil)
        self.path = path
        fillColor = UIColor.white
        
        startMoving()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMoving(){
        let moveLeft = SKAction.moveBy(x: -10, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
}
