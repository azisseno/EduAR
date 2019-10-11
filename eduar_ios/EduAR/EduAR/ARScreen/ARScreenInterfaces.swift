//
//  ARScreenInterfaces.swift
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

enum ARScreenNavigationOption {
}

protocol ARScreenRouterInterface: RouterInterface {
    func navigate(to option: ARScreenNavigationOption)
}

protocol ARScreenViewInterface: ViewInterface {
    var session: ARSession { get }
    var updateQueue: DispatchQueue { get }
    func createRaycastAndUpdate3DPosition(of virtualObject: VirtualObject, from query: ARRaycastQuery)
    func createTrackedRaycastAndSet3DPosition(of virtualObject: VirtualObject,
                                              from query: ARRaycastQuery,
                                              withInitialResult initialResult: ARRaycastResult?) -> ARTrackedRaycast?

}

protocol ARScreenPresenterInterface: PresenterInterface {
}

protocol ARScreenInteractorInterface: InteractorInterface {
}
