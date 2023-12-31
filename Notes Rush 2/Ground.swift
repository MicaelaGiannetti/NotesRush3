//
//  Ground.swift
//  ArcadeGameTemplate
//
//  Created by Micaela Giannetti on 12/12/23.
//

import Foundation
import SpriteKit

class Ground : SKSpriteNode{
    var textureAtlas: SKTextureAtlas =
    SKTextureAtlas(named:"Environment-ground")
    func createChildren(){
        self.anchorPoint = CGPoint (x:0,y:1)
        let texture = textureAtlas.textureNamed("tundra")
        var tileCount : CGFloat = 0
        let tileSize = CGSize (width: 70, height: 70)
        
        while tileCount * tileSize.width<self.size.width{
            let tileNode = SKSpriteNode(texture:texture)
            tileNode.size = tileSize
            tileNode.position.x = tileCount * tileSize.width
            tileNode.zPosition = 1.0
            tileNode.anchorPoint = CGPoint (x:0,y:1)
            self.addChild(tileNode)
            
            tileCount += 1
            
          let pointTopLeft = CGPoint (x:0,y:0)
            let pointTopRight = CGPoint (x:size.width,y:0)
            self.physicsBody = SKPhysicsBody(edgeFrom: pointTopLeft, to: pointTopRight)
         
        }
        
       /* self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
                self.physicsBody?.isDynamic = false
                self.physicsBody?.categoryBitMask = PhysicsCategory.Ground
                self.physicsBody?.collisionBitMask = PhysicsCategory.Player
                self.physicsBody?.contactTestBitMask = PhysicsCategory.None */  
    }
    
}

