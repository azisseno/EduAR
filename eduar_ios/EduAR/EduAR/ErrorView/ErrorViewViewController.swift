//
//  ErrorViewViewController.swift
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

final class ErrorViewViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: ErrorViewPresenterInterface!
    
    // MARK: - Module Setup -
    func set(presenter: ErrorViewPresenterInterface) {
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
    
    @IBAction func retryPressed(_ sender: UIButton) {
        _presenter.retryPressed()
    }
}

// MARK: - Extensions -
extension ErrorViewViewController: ErrorViewViewInterface {
    
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
