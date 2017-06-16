//
//  GameScene.swift
//  endlessRunner
//
//  Created by Tushit Jain on 3/6/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//
import SpriteKit
import GameplayKit
class GameScene: SKScene, SKPhysicsContactDelegate {
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var movingGround: MovingGround!
    var hero : Hero!
    var cloudGen : cloudGenerator!
    var wallGen : WallGenerator!
    var lastTime : TimeInterval = 0
    var isStarted = false
    var isGameOver = false
    override func didMove(to view: SKView) {
        view.showsNodeCount = true;
        backgroundColor = UIColor(red: 150/250, green: 200/250, blue: 244/255, alpha: 1.90)
        //let backgroundTexture = SKTexture(imageNamed: "bg.jpg")
        //let backgroundImage = SKSpriteNode(texture: backgroundTexture , size: view.frame.size)
        //backgroundImage.position = view.center
        //addChild(backgroundImage)
        //makeBackground()
        //let ground = SKSpriteNode(color: .red, size: CGSize(width :view.frame.size.width , height : 20))
        movingGround = MovingGround(size: CGSize(width: view.frame.width, height: 20))
        //ground.position = view.center
        movingGround.position = CGPoint(x: 0, y: view.frame.size.height/2)
        addChild(movingGround)
        hero = Hero()
        hero.position = CGPoint(x:70 ,y:movingGround.position.y + movingGround.size.height/2 + hero.frame.size.height/2)
        addChild(hero)
        hero.breathe()
        //let r = Timer(5)
        cloudGen = cloudGenerator(color: UIColor.clear, size: view.frame.size)
        cloudGen.position = view.center
        addChild(cloudGen)
        cloudGen.populate(num: 7)
        //cloudGen.startGenWithSpanTime(seconds: 5)
        wallGen = WallGenerator(color: UIColor.clear,size:view.frame.size)
        wallGen.position = view.center
        addChild(wallGen)
        let tapToStart = SKLabelNode(text: "Tap to Start!")
        tapToStart.name = "startLabel"
        tapToStart.fontName = "Helvetica"
        tapToStart.position.x = view.center.x
        tapToStart.position.y = view.center.y + 35
        tapToStart.fontColor = UIColor.brown
        addChild(tapToStart)
        addPointsLabel()
        loadScore()
        physicsWorld.contactDelegate = self
    }
    func loadScore(){
        let defaults = UserDefaults.standard
        let highScore = childNode(withName: "highScore") as! Points
        highScore.setTo(number: defaults.integer(forKey: "highScore"))
    }
    func start(){
        isStarted=true
        let tapToStart = childNode(withName: "startLabel")
        tapToStart?.removeFromParent()
        hero.stop()
        //hero.breathe()
        movingGround.start()
        wallGen.startGeneratingWall(seconds: 1)
    }
    func restart(){
        cloudGen.stopGenerating()
        let newScene = GameScene(size: view!.bounds.size)
        newScene.scaleMode = .aspectFill
        view!.presentScene(newScene)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isGameOver{
            restart()
        }
        if !isStarted{
            start()
        }
        else{
            hero.flip()
            let pointsLabel = childNode(withName: "pointsLabel") as! Points
            pointsLabel.incrementPoints()
        }
    }
    func addPointsLabel(){
        let pointslabel = Points(num: 0)
        pointslabel.position = CGPoint(x: 20.0, y: view!.frame.size.height - 35)
        pointslabel.name="pointsLabel"
        addChild(pointslabel)
        let highScoreLabel = Points(num: 0)
        highScoreLabel.position = CGPoint(x: view!.frame.size.width - 35, y: view!.frame.size.height - 35)
        highScoreLabel.name="highScore"
        addChild(highScoreLabel)
    }
    func makeBackground() {
        let backgroundTexture = SKTexture(imageNamed: "bg2.jpg")
        //move background right to left; replace
        let shiftBackground = SKAction.moveBy(x: -backgroundTexture.size().width, y: 0, duration: 9)
        let replaceBackground = SKAction.moveBy(x: backgroundTexture.size().width, y:0, duration: 0)
        let movingAndReplacingBackground = SKAction.repeatForever(SKAction.sequence([shiftBackground,replaceBackground]))
        for i in 0  ..< 3{
            let o = CGFloat(i)
            //defining background; giving it height and moving width
            let background=SKSpriteNode(texture:backgroundTexture)
            background.position = CGPoint(x: backgroundTexture.size().width/2 + (backgroundTexture.size().width * o), y: self.frame.midY)
            background.size.height = self.frame.height
            background.run(movingAndReplacingBackground)
            self.addChild(background)
        }
    }
    override func update(_ currentTime: TimeInterval) {
        if currentTime - lastTime > 15 {
            lastTime=currentTime
            cloudGen.startGenWithSpanTime()
        }
        // cloudGen.startGenWithSpanTime()
        // Called before each frame is rendered
    }
    func gameOver(){
        isGameOver = true
        hero.physicsBody = nil
        wallGen.stopWalls()
        movingGround.stop()
        hero.stop()
        let gameOverLabel = SKLabelNode(text : "Game Over")
        gameOverLabel.name = "startLabel"
        gameOverLabel.fontName = "Helvetica"
        gameOverLabel.position.x = view!.center.x
        gameOverLabel.position.y = view!.center.y + 35
        gameOverLabel.fontColor = UIColor.brown
        addChild(gameOverLabel)
        let pointsLabel = childNode(withName: "pointsLabel") as! Points
        let highScore = childNode(withName: "highScore") as! Points
        if highScore.number < pointsLabel.number{
            highScore.setTo(number: pointsLabel.number)
            let defaults = UserDefaults.standard
            defaults.set(highScore.number, forKey: "highScore")
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print("Smee")
        gameOver()
    }
}
