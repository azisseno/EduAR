//
//  ARScreenBuilder.swift
//  EduAR
//
//  Created by admin on 09/10/19.
//  Copyright © 2019 iic. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import Foundation
import UIKit
import Common

protocol ARScreenBuilderInterface: BuilderInterface {
    func resolve() -> ARScreenInteractorInterface
    func resolve(presenter: ARScreenPresenterInterface) -> ARScreenViewController
    func resolve() -> ARScreenPresenterInterface
    func resolve() -> ARScreenRouterInterface
}

extension ARScreenBuilderInterface {
    func resolve() -> ARScreenInteractorInterface {
        return ARScreenInteractor()
    }
    
    func resolve(presenter: ARScreenPresenterInterface) -> ARScreenViewController {
        let _storyboard = UIStoryboard(name: "ARScreen", bundle: Bundle(for: ARScreenBuilder.self))
        let view: ARScreenViewController = _storyboard.instantiateViewController(ofType: ARScreenViewController.self)
        view.set(presenter: presenter)
        return view
    }
    
    func resolve() -> ARScreenPresenterInterface {
        return ARScreenPresenter(interactor: resolve())
    }
    
    func resolve() -> ARScreenRouterInterface {
        return ARScreenRouter()
    }
    
    func main(data: ARData, adaptiveDelegate: UIAdaptivePresentationControllerDelegate? = nil) -> UIViewController {
        let router: ARScreenRouterInterface = resolve()
        let presenter: ARScreenPresenterInterface = resolve()
        presenter.set(router: router)
        let view: ARScreenViewController = resolve(presenter: presenter)
        view.arData = data
        presenter.set(view: view)
        router.set(view: view)
        view.presentationController?.delegate = adaptiveDelegate
        return view
    }
    
}

class ARScreenBuilder: ARScreenBuilderInterface { }
