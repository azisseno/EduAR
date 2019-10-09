//___FILEHEADER___
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import Foundation
import UIKit
import Common

protocol ___VARIABLE_moduleName___BuilderInterface: BuilderInterface {
    func resolve() -> ___VARIABLE_moduleName___InteractorInterface
    func resolve(presenter: ___VARIABLE_moduleName___PresenterInterface) -> ___VARIABLE_moduleName___ViewController
    func resolve() -> ___VARIABLE_moduleName___PresenterInterface
    func resolve() -> ___VARIABLE_moduleName___RouterInterface
}

extension ___VARIABLE_moduleName___BuilderInterface {
    func resolve() -> ___VARIABLE_moduleName___InteractorInterface {
        return ___VARIABLE_moduleName___Interactor()
    }
    
    func resolve(presenter: ___VARIABLE_moduleName___PresenterInterface) -> ___VARIABLE_moduleName___ViewController {
        let _storyboard = UIStoryboard(name: "___VARIABLE_moduleName___", bundle: Bundle(for: ___VARIABLE_moduleName___Builder.self))
        let view: ___VARIABLE_moduleName___ViewController = _storyboard.instantiateViewController(ofType: ___VARIABLE_moduleName___ViewController.self)
        view.set(presenter: presenter)
        return view
    }
    
    func resolve() -> ___VARIABLE_moduleName___PresenterInterface {
        return ___VARIABLE_moduleName___Presenter(interactor: resolve())
    }
    
    func resolve() -> ___VARIABLE_moduleName___RouterInterface {
        return ___VARIABLE_moduleName___Router()
    }
    
    func main() -> UIViewController {
        let router: ___VARIABLE_moduleName___RouterInterface = resolve()
        let presenter: ___VARIABLE_moduleName___PresenterInterface = resolve()
        presenter.set(router: router)
        let view: ___VARIABLE_moduleName___ViewController = resolve(presenter: presenter)
        presenter.set(view: view)
        router.set(view: view)
        return view
    }
    
}

class ___VARIABLE_moduleName___Builder: ___VARIABLE_moduleName___BuilderInterface { }
