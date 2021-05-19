//
//  ViewController.swift
//  SmartPhotos
//
//  Created by Saloni Aggarwal on 4/30/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        if let trackedimage = ARReferenceImage.referenceImages(inGroupNamed: "pics", bundle: Bundle.main){
            configuration.trackingImages = trackedimage
            configuration.maximumNumberOfTrackedImages = 2
        }
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate

    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let scene = SKScene(size: CGSize(width: 640, height: 360))
        let node = SCNNode()
        
        if let imageanchor = anchor as? ARImageAnchor{
            let plane = SCNPlane(width: imageanchor.referenceImage.physicalSize.width, height:imageanchor.referenceImage.physicalSize.height )
            plane.firstMaterial?.diffuse.contents = scene
            let planenode = SCNNode(geometry: plane)
            
            planenode.eulerAngles.x = -.pi/2
            node.addChildNode(planenode)
            
            var imagename = imageanchor.referenceImage.name ?? "unknown"
            var filename = imagename+".mp4"
            let videoNode = SKVideoNode(fileNamed: filename)
            
            videoNode.play()
            videoNode.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
            videoNode.yScale =   -1.0
            
            scene.addChild(videoNode)
            
        }
        return node
    }
}
