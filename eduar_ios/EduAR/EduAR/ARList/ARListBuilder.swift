//
//  ARListBuilder.swift
//  EduAR
//
//  Created by Chandra Welim on 21/10/19.
//  Copyright © 2019 iic. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import Foundation
import UIKit
import Common

protocol ARListBuilderInterface: BuilderInterface {
    func resolve() -> ARListInteractorInterface
    func resolve(presenter: ARListPresenterInterface) -> ARListViewController
    func resolve() -> ARListPresenterInterface
    func resolve() -> ARListRouterInterface
}

extension ARListBuilderInterface {
    func resolve() -> ARListInteractorInterface {
        return ARListInteractor()
    }
    
    func resolve(presenter: ARListPresenterInterface) -> ARListViewController {
        let _storyboard = UIStoryboard(name: "ARList", bundle: Bundle(for: ARListBuilder.self))
        let view: ARListViewController = _storyboard.instantiateViewController(ofType: ARListViewController.self)
        view.set(presenter: presenter)
        return view
    }
    
    func resolve() -> ARListPresenterInterface {
        return ARListPresenter(interactor: resolve())
    }
    
    func resolve() -> ARListRouterInterface {
        return ARListRouter()
    }
    
    func main() -> UIViewController {
        let router: ARListRouterInterface = resolve()
        let presenter: ARListPresenterInterface = resolve()
        presenter.set(router: router)
        let view: ARListViewController = resolve(presenter: presenter)
        presenter.set(view: view)
        router.set(view: view)
        return view
    }
    
}

class ARListBuilder: ARListBuilderInterface { }
