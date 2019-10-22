//
//  ErrorViewRouter.swift
//  EduAR
//
//  Created by ven5ch on 22/10/19.
//  Copyright © 2019 iic. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit
import Common

// This block would be the `Builder`
final class ErrorViewRouter: RouterInterface {

    // MARK: - Default properties -
    private weak var _view: ErrorViewViewController?

    // MARK: - Lifecycle -
    func set(view: ViewInterface) {
        _view = view as? ErrorViewViewController
    }

}

// MARK: - Extensions -
// This block would be the `Router`
extension ErrorViewRouter: ErrorViewRouterInterface {

    func navigate(to option: ErrorViewNavigationOption) {
    }
}
