//
//
//  ErrorViewPresenter.swift
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

final class ErrorViewPresenter {

    // MARK: - Default properties -
    private weak var _view: ErrorViewViewInterface?
    private var _interactor: ErrorViewInteractorInterface
    private var _router: ErrorViewRouterInterface?

    // MARK: - Module Setup -
    init(interactor: ErrorViewInteractorInterface) {
        _interactor = interactor
    }
    
    func set(router: RouterInterface) {
        _router = router as? ErrorViewRouterInterface
    }
    
    func set(view: ViewInterface) {
        _view = view as? ErrorViewViewInterface
    }

}

// MARK: - Extensions -
extension ErrorViewPresenter: ErrorViewPresenterInterface {
    
    func retryPressed() {
        _interactor.checkRemoteConfigAppEnabled { [weak self] in
            guard let ws = self else { return }
            if ws._interactor.appEnabled() {
                ws._view?.dismissView()
            }
        }
    }
}
