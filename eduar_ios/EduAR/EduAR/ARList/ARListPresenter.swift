//
//
//  ARListPresenter.swift
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

final class ARListPresenter {

    // MARK: - Default properties -
    private weak var _view: ARListViewInterface?
    private var _interactor: ARListInteractorInterface
    private var _router: ARListRouterInterface?
    var arDatas: [ARData] = []
    
    // MARK: - Module Setup -
    init(interactor: ARListInteractorInterface) {
        _interactor = interactor
    }
    
    func set(router: RouterInterface) {
        _router = router as? ARListRouterInterface
    }
    
    func set(view: ViewInterface) {
        _view = view as? ARListViewInterface
    }
    
    func viewDidLoad() {
        _interactor.fetchARList()
    }
}

// MARK: - Extensions -
extension ARListPresenter: ARListPresenterInterface {
        
    func arListFetched(arDatas: [ARData]) {
        self.arDatas = arDatas
        _view?.reloadData()
    }
    
    func getARList() -> [ARData] {
        return arDatas
    }
    
    func onTapRowAtIndex() {
        _router?.navigate(to: .arScreen)
    }
}
