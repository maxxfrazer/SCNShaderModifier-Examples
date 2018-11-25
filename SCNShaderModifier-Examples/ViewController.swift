//
//  ViewController.swift
//  SCNShaderModifier-Examples
//
//  Created by Max Cobb on 11/22/18.
//  Copyright © 2018 Max Cobb. All rights reserved.
//

import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

	@IBOutlet var sceneView: ARSCNView!

	override func viewDidLoad() {
		super.viewDidLoad()

		sceneView.delegate = self
		let scene = SCNScene()
		sceneView.scene = scene

		self.addLight()

		var geometryNode: SCNNode!
		switch Int.random(in: 0...2) {
		case 0:
			geometryNode = cubeRotateSkew()
		case 1:
			geometryNode = sphereRipple()
		default:
			geometryNode = sphereSun()
		}

		geometryNode.position.z = -1.5
		scene.rootNode.addChildNode(geometryNode)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		sceneView.session.run(ARWorldTrackingConfiguration())
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		sceneView.session.pause()
	}

	func addLight() {
		let light = SCNLight()
		light.type = .omni
		sceneView.pointOfView?.light = light
	}
}
