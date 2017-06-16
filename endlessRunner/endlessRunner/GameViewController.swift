//
//  GameViewController.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/6/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//
import UIKit
import SpriteKit
import GameplayKit
class GameViewController: UIViewController {
    var scene: GameScene!
    override func viewDidLoad() {
        super.viewDidLoad()
        //configure the view
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        //create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        //present the scene
        skView.presentScene(scene)
    }
    override var shouldAutorotate: Bool {
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
