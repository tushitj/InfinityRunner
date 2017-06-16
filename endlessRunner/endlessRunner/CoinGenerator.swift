//
//  CoinGenerator.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/13/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//
import Foundation
import SpriteKit
class CoinGenerator:SKSpriteNode {
    var generationTimer : Timer!
    //var coins = [Coin]()
    func startGeneratingCoin(seconds : TimeInterval){
        generationTimer = Timer.scheduledTimer(timeInterval: seconds,target: self , selector:#selector(CoinGenerator.generatedCoin) ,userInfo:nil , repeats: true)
    }
    func stopGenerating(){
        generationTimer.invalidate()
    }
    func generatedCoin(){
        //       var scale:CGFloat
        //        let rand = arc4random_uniform(2)
        //        if rand == 0 {
        //            scale = -1.0
        //
        //        }
        //        else{
        //            scale = 1.0
        //        }
        //let coin = Coin()
        //coin.position = CGPoint(x: 0, y: 3.5)
        //coins.append(coin)
        //addChild(coin)
    }
    func stopCoins(){
        stopGenerating()
    }
}
