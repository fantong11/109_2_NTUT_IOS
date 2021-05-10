//
//  ViewController.swift
//  VirtualCamera
//
//  Created by 范桶 on 2021/4/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        addBox()
    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        sceneView.scene.background.contents = UIColor.black

    }
    
    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)
        sceneView.session.pause()

    }

    func addBox() {

        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)

        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.position = SCNVector3(0, 0, -0.2)
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(boxNode)
        sceneView.scene = scene

    }
}

