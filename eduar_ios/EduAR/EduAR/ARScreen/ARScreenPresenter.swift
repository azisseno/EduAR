//
//
//  ARScreenPresenter.swift
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

final class ARScreenPresenter {

    // MARK: - Default properties -
    private weak var _view: ARScreenViewInterface?
    private var _interactor: ARScreenInteractorInterface
    private var _router: ARScreenRouterInterface?

    // MARK: - Module Setup -
    init(interactor: ARScreenInteractorInterface) {
        _interactor = interactor
    }
    
    func set(router: RouterInterface) {
        _router = router as? ARScreenRouterInterface
    }
    
    func set(view: ViewInterface) {
        _view = view as? ARScreenViewInterface
    }

}

// MARK: - Extensions -
extension ARScreenPresenter: ARScreenPresenterInterface {
}
