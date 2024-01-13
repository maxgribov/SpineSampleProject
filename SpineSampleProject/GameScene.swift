//
//  GameScene.swift
//  SpineSampleProject
//
//  Created by Max Gribov on 22/02/2018.
//  Copyright © 2018 Max Gribov. All rights reserved.
//

import SpriteKit
import GameplayKit
import Spine

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        do {
            
            let character = try Skeleton(json: "goblins-ess", folder: "goblins", skin: "goblin")
            character.name = "character"
            character.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 200)
            addChild(character)
            
            let walkAnimation = try character.action(animation: "walk")
            character.run(.repeatForever(walkAnimation))
            
            let switchSkinsAction = SKAction.sequence([.wait(forDuration: 3),
                                                       try character.action(applySkin: "goblingirl"),
                                                       .wait(forDuration: 3),
                                                       try character.action(applySkin: "goblin")])

            character.run(.repeatForever(switchSkinsAction))

        } catch {
            
            print(error)
        }
    }
}
