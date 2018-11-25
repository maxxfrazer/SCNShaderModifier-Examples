//
//  ShaderGeometries.swift
//  SCNShaderModifier-Examples
//
//  Created by Max Cobb on 11/22/18.
//  Copyright © 2018 Max Cobb. All rights reserved.
//

import SceneKit

private func getShader(from filename: String) -> String {
	do {
		if let dirs = Bundle.main.url(forResource: filename, withExtension: "shader") {
			return try String(contentsOf: dirs, encoding: .utf8)
		}
	} catch {
		print(error)
	}
	print("shader \(filename) not found")
	return ""
}

func cubeRotateSkew() -> SCNNode {
	let cubeGeometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
	cubeGeometry.firstMaterial?.diffuse.contents = UIColor.red
	cubeGeometry.shaderModifiers = [
		.geometry: getShader(from: "cube_circular")
	]
	let node = SCNNode(geometry: cubeGeometry)
	node.scale = SCNVector3(0.5, 0.5, 0.5)
	return node
}

func sphereRipple() -> SCNNode {
	let sphereGeometry = SCNSphere(radius: 1)
	sphereGeometry.segmentCount = 100
	sphereGeometry.firstMaterial?.diffuse.contents = UIColor.red
	sphereGeometry.shaderModifiers = [
		.geometry: getShader(from: "sphere_ripple")
	]
	let node = SCNNode(geometry: sphereGeometry)
	node.scale = SCNVector3(0.5, 0.5, 0.5)
	return node
}

func sphereSun() -> SCNNode {
	let sunGeometry = SCNSphere(radius: 1)
	sunGeometry.shaderModifiers = [
		.surface: getShader(from: "sun_surface"),
		.geometry: getShader(from: "sun_geometry")
	]
	let node = SCNNode(geometry: sunGeometry)
	node.scale = SCNVector3(0.5, 0.5, 0.5)

	let ambientLight = SCNLight()
	ambientLight.type = .ambient
	node.light = ambientLight

	return node
}
