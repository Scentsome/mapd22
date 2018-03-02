//
//  GameViewController.swift
//  SceneKitDemo
//
//  Created by Michael on 02/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    var scnView:SCNView? = nil
    var scnScene:SCNScene? = nil
    var cameraNode:SCNNode? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
        spawnShape()
    }
    func spawnShape() {
        var geometry:SCNGeometry = SCNGeometry()
            geometry = SCNCone(topRadius: 0.25, bottomRadius: 0.5, height: 1.0)
        let geometerNode:SCNNode = SCNNode(geometry: geometry)
        scnScene?.rootNode.addChildNode(geometerNode)
        geometerNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        let randomX = Float(arc4random_uniform(5)) - Float(2)
        let randomY = Float(arc4random() % 9) + Float(10)
        let force = SCNVector3(x: randomX, y: randomY , z: -1.0)
        let position = SCNVector3(x: 0.05, y: 0.05, z: 0.05)
        geometerNode.physicsBody?.applyForce(force, at: position, asImpulse: true)

    }
    func setupCamera() {
        cameraNode = SCNNode()
        cameraNode?.camera = SCNCamera()
        cameraNode?.position = SCNVector3Make(0.0, 0.0, 5.0)
        scnScene?.rootNode.addChildNode(cameraNode!)
    }
    func setupView(){
        scnView = self.view as? SCNView
        scnView?.showsStatistics = true
        scnView?.allowsCameraControl = true
        scnView?.autoenablesDefaultLighting = true
    }
    func setupScene() {
        scnScene = SCNScene()
        scnView?.scene = scnScene
        scnScene?.background.contents = UIImage(named:"Background_Diffuse")
    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
