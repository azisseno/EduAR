//
//  ARScreenViewController.swift
//  EduAR
//
//  Created by admin on 09/10/19.
//  Copyright © 2019 iic. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit
import Common
import ARKit

final class ARScreenViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: ARScreenPresenterInterface!
    
    // MARK: - Module Setup -
    func set(presenter: ARScreenPresenterInterface) {
        _presenter = presenter
    }
    
    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
        _presenter.viewDidLoad()
    }
	
    // MARK: - Setup Initial View
    private func _setupView() {
        // Write your initial setup here
    }
    
    // MARK: - IBOutlets
    @IBOutlet var sceneView: VirtualObjectARView!
    @IBOutlet weak var addObjectButton: UIButton!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var upperControlsView: UIView!

    // MARK: - UI Elements
    let coachingOverlay = ARCoachingOverlayView()
    var focusSquare = FocusSquare()
    lazy var statusViewController: ARScreenStatusViewController = {
        return children.lazy.compactMap({ $0 as? ARScreenStatusViewController }).first!
    }()

    // MARK: - ARKit Configuration Properties
    let virtualObjectLoader = VirtualObjectLoader()
    var isRestartAvailable = true
    lazy var virtualObjectInteraction = VirtualObjectInteraction(sceneView: sceneView, viewController: self)

}

// MARK: - Extensions from interface
extension ARScreenViewController: ARScreenViewInterface {
    
    var session: ARSession {
        return sceneView.session
    }

    var updateQueue: DispatchQueue {
        return DispatchQueue(label: "com.iic.EduAR.Common.serialSceneKitQueue")
    }
    
    func createRaycastAndUpdate3DPosition(of virtualObject: VirtualObject, from query: ARRaycastQuery) {
        guard let result = session.raycast(query).first else {
            return
        }
        
        if virtualObject.allowedAlignment == .any && self.virtualObjectInteraction.trackedObject == virtualObject {
            
            // If an object that's aligned to a surface is being dragged, then
            // smoothen its orientation to avoid visible jumps, and apply only the translation directly.
            virtualObject.simdWorldPosition = result.worldTransform.translation
            
            let previousOrientation = virtualObject.simdWorldTransform.orientation
            let currentOrientation = result.worldTransform.orientation
            virtualObject.simdWorldOrientation = simd_slerp(previousOrientation, currentOrientation, 0.1)
        } else {
            self.setTransform(of: virtualObject, with: result)
        }
    }
    
    
    func createTrackedRaycastAndSet3DPosition(of virtualObject: VirtualObject,
                                              from query: ARRaycastQuery,
                                              withInitialResult initialResult: ARRaycastResult? = nil) -> ARTrackedRaycast? {
        
        if let initialResult = initialResult {
            self.setTransform(of: virtualObject, with: initialResult)
        }
        
        return session.trackedRaycast(query) { (results) in
            self.setVirtualObject3DPosition(results, with: virtualObject)
        }
    }
}

// MARK: - Internal Functions
extension ARScreenViewController {
    
    // - Tag: ProcessRaycastResults
    private func setVirtualObject3DPosition(_ results: [ARRaycastResult], with virtualObject: VirtualObject) {
        
        guard let result = results.first else {
            fatalError("Unexpected case: the update handler is always supposed to return at least one result.")
        }
        
        self.setTransform(of: virtualObject, with: result)
        
        // If the virtual object is not yet in the scene, add it.
        if virtualObject.parent == nil {
            self.sceneView.scene.rootNode.addChildNode(virtualObject)
            
            virtualObject.shouldUpdateAnchor = true
        }
        
        if virtualObject.shouldUpdateAnchor {
            virtualObject.shouldUpdateAnchor = false
            self.updateQueue.async {
                self.sceneView.addOrUpdateAnchor(for: virtualObject)
            }
        }
    }
    
    func setTransform(of virtualObject: VirtualObject, with result: ARRaycastResult) {
        virtualObject.simdWorldTransform = result.worldTransform
    }
}
