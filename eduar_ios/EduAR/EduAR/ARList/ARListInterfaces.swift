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

struct ARListConstant {
    static let appEnable: String = "configmmkau"
}

enum ARListNavigationOption {
    case arScreen(ARData)
}

protocol ARListRouterInterface: RouterInterface {
    func navigate(to option: ARListNavigationOption)
}

protocol ARListViewInterface: ViewInterface {
    func reloadTableView()
}

protocol ARListPresenterInterface: PresenterInterface {
    func numberOfRows() -> Int
    func getArData(atIndex index: Int) -> ARData
    func onTapList(atIndex index: Int)
    func onModaDismiss()
}

protocol ARListInteractorInterface: InteractorInterface {
    func fetchARList() -> [ARData]
    func checkRemoteConfigAppEnabled()
    func appEnabled() -> Bool
}
