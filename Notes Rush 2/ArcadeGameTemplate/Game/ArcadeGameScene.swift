//
//  ArcadeGameScene.swift
//  ArcadeGameTemplate
//

import SpriteKit
import SwiftUI


class ArcadeGameScene: SKScene {
    /**
     * # The Game Logic
     *     The game logic keeps track of the game variables
     *   you can use it to display information on the SwiftUI view,
     *   for example, and comunicate with the Game Scene.
     **/
    var gameLogic: ArcadeGameLogic = ArcadeGameLogic.shared
    
    // Keeps track of when the last update happend.
    // Used to calculate how much time has passed between updates.
    var lastUpdate: TimeInterval = 0
    let cam = SKCameraNode()
    let player = SKSpriteNode (imageNamed: "player1")
    
    
    
    override func didMove(to view: SKView) {
        
        let ground = SKSpriteNode(color: .darkGray, size: CGSize(width: self.size.width * 6, height: 400))
        ground.position = CGPoint (x: -100, y: 0)
      //  let pointTopLeft = CGPoint (x:0, y:400)
      //  let pointTopRight = CGPoint (x: size.width, y:400)
        self.physicsBody = SKPhysicsBody (rectangleOf: ground.size)
        self.addChild(ground)
        
        
        self.anchorPoint = .zero
        
        self.camera = cam
        self.addRunningPlayer()
        
        self.setUpGame()
        self.setUpPhysicsWorld()
        
        
    }
    
    //Keep camera on player
    
    override func didSimulatePhysics() {
        self.camera!.position = player.position
    }
    
    func addRunningPlayer(){
        self.player.position = CGPoint (x: 250, y: 250)
        self.addChild(player)
        self.player.physicsBody = SKPhysicsBody(circleOfRadius: size.width)
        self.player.physicsBody?.affectedByGravity = true
        
        //creating animation for the player running
        let playerAtlas = SKTextureAtlas(named:"RunningPlayer")
        let playerFrames : [SKTexture] = [
            playerAtlas.textureNamed("player1"),
            playerAtlas.textureNamed("player2"),
            playerAtlas.textureNamed("player3"),
            playerAtlas.textureNamed("player4")]

        let runAction = SKAction.animate(with: playerFrames, timePerFrame: 0.14)
        let playerAction = SKAction.repeatForever(runAction)
        player.run(playerAction)
        
        let moveRight = SKAction.moveBy(x:size.width, y:0, duration: 2)
        let neverEndingRun = SKAction.repeatForever(moveRight)
        player.run(neverEndingRun)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        // ...
        
        // If the game over condition is met, the game will finish
        if self.isGameOver { self.finishGame() }
        
        // The first time the update function is called we must initialize the
        // lastUpdate variable
        if self.lastUpdate == 0 { self.lastUpdate = currentTime }
        
        // Calculates how much time has passed since the last update
        let timeElapsedSinceLastUpdate = currentTime - self.lastUpdate
        // Increments the length of the game session at the game logic
    //    self.gameLogic.increaseSessionTime(by: timeElapsedSinceLastUpdate)
        
        self.lastUpdate = currentTime
    }
    
}

// MARK: - Game Scene Set Up
extension ArcadeGameScene {
    
    private func setUpGame() {
        self.gameLogic.setUpGame()
        self.backgroundColor = SKColor.white
        
        // TODO: Customize!
    }
    
    private func setUpPhysicsWorld() {
        // TODO: Customize!
       
        
    }
    
    private func restartGame() {
        self.gameLogic.restartGame()
    }
}


// MARK: - Handle Player Inputs
extension ArcadeGameScene {
    
    //TODO: Add comment here
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // TODO: Customize!
        
        self.gameLogic.finishTheGame()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // TODO: Customize!
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // TODO: Customize!
    }
    
}


// MARK: - Game Over Condition
extension ArcadeGameScene {
    
    /**
     * Implement the Game Over condition.
     * Remember that an arcade game always ends! How will the player eventually lose?
     *
     * Some examples of game over conditions are:
     * - The time is over!
     * - The player health is depleated!
     * - The enemies have completed their goal!
     * - The screen is full!
     **/
    
    var isGameOver: Bool {
        // TODO: Customize!
        
        // Did you reach the time limit?
        // Are the health points depleted?
        // Did an enemy cross a position it should not have crossed?
        
        return gameLogic.isGameOver
    }
    
    private func finishGame() {
        
        // TODO: Customize!
        
        gameLogic.isGameOver = true
    }
    
}

// MARK: - Register Score
extension ArcadeGameScene {
    
    private func registerScore() {
        // TODO: Customize!
    }
    
}
