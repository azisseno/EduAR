//
//  ErrorViewBuilder.swift
//  EduAR
//
//  Created by ven5ch on 22/10/19.
//  Copyright © 2019 iic. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import Foundation
import UIKit
import Common

protocol ErrorViewBuilderInterface: BuilderInterface {
    func resolve() -> ErrorViewInteractorInterface
    func resolve(presenter: ErrorViewPresenterInterface) -> ErrorViewViewController
    func resolve() -> ErrorViewPresenterInterface
    func resolve() -> ErrorViewRouterInterface
}

extension ErrorViewBuilderInterface {
    func resolve() -> ErrorViewInteractorInterface {
        return ErrorViewInteractor()
    }
    
    func resolve(presenter: ErrorViewPresenterInterface) -> ErrorViewViewController {
        let _storyboard = UIStoryboard(name: "ErrorView", bundle: Bundle(for: ErrorViewBuilder.self))
        let view: ErrorViewViewController = _storyboard.instantiateViewController(ofType: ErrorViewViewController.self)
        view.set(presenter: presenter)
        return view
    }
    
    func resolve() -> ErrorViewPresenterInterface {
        return ErrorViewPresenter(interactor: resolve())
    }
    
    func resolve() -> ErrorViewRouterInterface {
        return ErrorViewRouter()
    }
    
    func main() -> UIViewController {
        let router: ErrorViewRouterInterface = resolve()
        let presenter: ErrorViewPresenterInterface = resolve()
        presenter.set(router: router)
        let view: ErrorViewViewController = resolve(presenter: presenter)
        presenter.set(view: view)
        router.set(view: view)
        return view
    }
    
}

class ErrorViewBuilder: ErrorViewBuilderInterface { }
