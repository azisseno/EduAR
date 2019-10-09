//
//  ARScreenViewController.swift
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

final class ARScreenViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: ARScreenPresenterInterface!
    
    // MARK: - Module Setup -
    func set(presenter: ARScreenPresenterInterface) {
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
extension ARScreenViewController: ARScreenViewInterface {
}
