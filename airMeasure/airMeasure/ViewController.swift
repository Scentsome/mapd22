//
//  ViewController.swift
//  airMeasure
//
//  Created by Michael on 02/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    var sceneView:ARSCNView! = nil
    var msgLabel:UILabel! = nil
    var nodes:Array<Any>! = []
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = ARSCNView(frame: CGRect.zero)
        sceneView.delegate = self
        
        
        let tapRecognizer:UITapGestureRecognizer =
            UITapGestureRecognizer(
                target: self,
                action: #selector(ViewController.handleTap(sender:)))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        sceneView.addGestureRecognizer(tapRecognizer)
        
        view.addSubview(sceneView)
        
        msgLabel = UILabel(frame: .zero)
        msgLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        msgLabel.textAlignment = .center
        msgLabel.backgroundColor = UIColor.white
        view.addSubview(msgLabel)
    }
    
    @objc func handleTap(sender:UITapGestureRecognizer) {
        print("add node.....")
        let tapLocation:CGPoint = sender.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation, types: .featurePoint)
        print(hitTestResults)
        if (hitTestResults.first != nil) {
            let result:ARHitTestResult = hitTestResults.first!
            let position:SCNVector3 = positionFromMatrix(matrix: result.worldTransform)
            let sphere:SphereNode = SphereNode(position: position)
            
            sceneView.scene.rootNode.addChildNode(sphere)
            let lastNode:SphereNode? = nodes.last as? SphereNode
            nodes.append(sphere)
            
            if (lastNode != nil) {
                
                let distance:CGFloat = distanceToDestination(origin: lastNode!.position, dest: sphere.position)
                msgLabel.text = String(format: "Distance: %.2f meters", distance)
            }
            
//            ……
        }

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sceneView.frame = view.bounds
        msgLabel.frame = CGRect(x: 0, y: 16,
                                width: view.bounds.size.width, height: 64)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let config:ARWorldTrackingConfiguration = ARWorldTrackingConfiguration()
        sceneView.session.run(config,
                              options: [.resetTracking , .removeExistingAnchors])
    }
    
    func positionFromMatrix(matrix: matrix_float4x4) -> SCNVector3 {
        let column:simd_float4 = matrix.columns.3
        return SCNVector3Make(column.x, column.y, column.z)
    }
    
    func distanceToDestination(origin: SCNVector3, dest: SCNVector3) -> CGFloat {
        
        let dx:CGFloat = CGFloat(dest.x - origin.x)
        let dy:CGFloat = CGFloat(dest.y - origin.y)
        let dz:CGFloat = CGFloat(dest.z - origin.z)
        return sqrt(dx*dx + dy*dy + dz*dz)
    }


}
extension ViewController : ARSCNViewDelegate {
    func session(_ session: ARSession,
                 cameraDidChangeTrackingState camera: ARCamera) {
        var status:String = "Loading..."
        switch camera.trackingState {
        case .notAvailable:
            status = "Not Available"
            
        case .limited:
            status = "Analyzing"
            
        case .normal:
            status = "Ready"
        }
        msgLabel.text = status
    }
    
}

