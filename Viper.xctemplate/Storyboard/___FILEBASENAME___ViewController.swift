//___FILEHEADER___
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit
import Common

final class ___VARIABLE_moduleName___ViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: ___VARIABLE_moduleName___PresenterInterface!
    
    // MARK: - Module Setup -
    func set(presenter: ___VARIABLE_moduleName___PresenterInterface) {
        _presenter = presenter
    }
    
    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
        _presenter.viewDidLoad()
    }
	
    // MARK: - Setup Initial View
    private func _setupView() {
        // Write your initial setup here
    }

}

// MARK: - Extensions -
extension ___VARIABLE_moduleName___ViewController: ___VARIABLE_moduleName___ViewInterface {
}
