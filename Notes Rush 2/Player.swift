//
//  Player.swift
//  ArcadeGameTemplate
//
//  Created by Micaela Giannetti on 12/12/23.
//

import Foundation
import SpriteKit

class Player : SKSpriteNode{
    var initialSize : CGSize = CGSize(width: 48, height: 56)
    var textureAtlas : SKTextureAtlas = SKTextureAtlas(named: "RunningPlayer")
    var runAnimation = SKAction()
    
 
    
    init(){
        super.init(texture:nil, color:.clear, size:initialSize)
        createAnimations()
        self.run(runAnimation)
        self.physicsBody = SKPhysicsBody(circleOfRadius:size.width/2)
        
    }
    func createAnimations() {
        let runFrames: [SKTexture] =
        [textureAtlas.textureNamed("player1"),
         textureAtlas.textureNamed("player2")]
        let runAction = SKAction.animate(with: runFrames, timePerFrame: 0.14)
        runAnimation = SKAction.repeatForever(runAction)
    }
    
    func RunningPlayer () {
        let moveRight = SKAction.moveBy(x:size.width, y:0, duration: 2)
        let neverEndingRun = SKAction.repeatForever(moveRight)
        self.run(neverEndingRun)
    }
    
    required init? (coder aDecoder: NSCoder){
        super.init(coder:aDecoder)
    }
}
