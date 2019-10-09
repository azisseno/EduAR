//
//  ARScreenRouter.swift
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

// This block would be the `Builder`
final class ARScreenRouter: RouterInterface {

    // MARK: - Default properties -
    private weak var _view: ARScreenViewController?

    // MARK: - Lifecycle -
    func set(view: ViewInterface) {
        _view = view as? ARScreenViewController
    }

}

// MARK: - Extensions -
// This block would be the `Router`
extension ARScreenRouter: ARScreenRouterInterface {

    func navigate(to option: ARScreenNavigationOption) {
    }
}
