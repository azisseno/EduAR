//___FILEHEADER___
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit
import Common

// This block would be the `Builder`
final class ___VARIABLE_moduleName___Router: RouterInterface {

    // MARK: - Default properties -
    private weak var _view: ___VARIABLE_moduleName___ViewController?

    // MARK: - Lifecycle -
    func set(view: ViewInterface) {
        _view = view as? ___VARIABLE_moduleName___ViewController
    }

}

// MARK: - Extensions -
// This block would be the `Router`
extension ___VARIABLE_moduleName___Router: ___VARIABLE_moduleName___RouterInterface {

    func navigate(to option: ___VARIABLE_moduleName___NavigationOption) {
    }
}
