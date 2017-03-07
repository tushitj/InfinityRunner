//
//  Hero.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/7/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import Foundation
import SpriteKit
class Hero : SKSpriteNode {
    var body : SKSpriteNode!
    var arm : SKSpriteNode!
    var leftFoot : SKSpriteNode!
    var rightFoot : SKSpriteNode!
    
    
    //override init(){
    init() {
        super.init(texture: nil , color:UIColor.clear , size: CGSize(width: 32, height: 44))
        
        body = SKSpriteNode(color: UIColor.black, size: CGSize(width: self.frame.size.width, height: 40))
        body.position = CGPoint(x: 0, y: 2)
        addChild(body)
        let skinColor = UIColor(red: 207/255, green: 193/255, blue: 168/255, alpha: 1.0)
        let face = SKSpriteNode(color: skinColor, size: CGSize(width:self.frame.size.width , height:12))
        face.position = CGPoint(x: 0, y: 6)
        body.addChild(face)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
