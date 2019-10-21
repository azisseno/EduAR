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
    case arScreen
}

protocol ARListRouterInterface: RouterInterface {
    func navigate(to option: ARListNavigationOption)
}

protocol ARListViewInterface: ViewInterface {
    func reloadData()
}

protocol ARListPresenterInterface: PresenterInterface {
    func arListFetched(arDatas: [ARData])
    func getARList() -> [ARData]
    func onTapRowAtIndex()
}

protocol ARListInteractorInterface: InteractorInterface {
    func fetchARList()
}
