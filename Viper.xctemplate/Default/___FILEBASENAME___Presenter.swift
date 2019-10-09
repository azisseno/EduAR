//
//___FILEHEADER___
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit
import Common

final class ___VARIABLE_moduleName___Presenter {

    // MARK: - Default properties -
    private weak var _view: ___VARIABLE_moduleName___ViewInterface?
    private var _interactor: ___VARIABLE_moduleName___InteractorInterface
    private var _router: ___VARIABLE_moduleName___RouterInterface?

    // MARK: - Module Setup -
    init(interactor: ___VARIABLE_moduleName___InteractorInterface) {
        _interactor = interactor
    }
    
    func set(router: RouterInterface) {
        _router = router as? ___VARIABLE_moduleName___RouterInterface
    }
    
    func set(view: ViewInterface) {
        _view = view as? ___VARIABLE_moduleName___ViewInterface
    }

}

// MARK: - Extensions -
extension ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterInterface {
}
