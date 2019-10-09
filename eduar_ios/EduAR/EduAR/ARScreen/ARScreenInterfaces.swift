//
//  ARScreenInterfaces.swift
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

enum ARScreenNavigationOption {
}

protocol ARScreenRouterInterface: RouterInterface {
    func navigate(to option: ARScreenNavigationOption)
}

protocol ARScreenViewInterface: ViewInterface {
}

protocol ARScreenPresenterInterface: PresenterInterface {
}

protocol ARScreenInteractorInterface: InteractorInterface {
}
