//
//  ErrorViewInterfaces.swift
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

enum ErrorViewNavigationOption {
}

protocol ErrorViewRouterInterface: RouterInterface {
    func navigate(to option: ErrorViewNavigationOption)
}

protocol ErrorViewViewInterface: ViewInterface {
    func dismissView()
}

protocol ErrorViewPresenterInterface: PresenterInterface {
    func retryPressed()
}

protocol ErrorViewInteractorInterface: InteractorInterface {
    func checkRemoteConfigAppEnabled(completion: (() -> ())?)
    func appEnabled() -> Bool
}
