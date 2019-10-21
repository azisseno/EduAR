//
//  ARListInterfaces.swift
//  EduAR
//
//  Created by Chandra Welim on 21/10/19.
//  Copyright © 2019 iic. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit
import Common

enum ARListNavigationOption {
}

protocol ARListRouterInterface: RouterInterface {
    func navigate(to option: ARListNavigationOption)
}

protocol ARListViewInterface: ViewInterface {
    func setupTableView()
}

protocol ARListPresenterInterface: PresenterInterface {
    func openDetail()
}

protocol ARListInteractorInterface: InteractorInterface {
}
