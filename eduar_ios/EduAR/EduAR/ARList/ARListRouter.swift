//
//  ARListRouter.swift
//  EduAR
//
//  Created by Chandra Welim on 21/10/19.
//  Copyright © 2019 iic. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit
import Common

// This block would be the `Builder`
final class ARListRouter: RouterInterface {

    // MARK: - Default properties -
    private weak var _view: ARListViewController?

    // MARK: - Lifecycle -
    func set(view: ViewInterface) {
        _view = view as? ARListViewController
    }

}

// MARK: - Extensions -
// This block would be the `Router`
extension ARListRouter: ARListRouterInterface {

    func navigate(to option: ARListNavigationOption) {
        switch option {
        case .arScreen(let data):
            let vc = ARScreenBuilder().main(data: data)
            self._view?.navigationController?.present(vc, animated: true, completion: nil)
        }
    }
}
