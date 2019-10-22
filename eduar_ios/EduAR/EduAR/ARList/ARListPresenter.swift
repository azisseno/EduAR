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
        arDatas = _interactor.fetchARList()
        _view?.reloadTableView()
    }
    
    func viewWillAppear(animated: Bool) {
        _interactor.checkRemoteConfigAppEnabled()
        if _interactor.appEnabled() {
            print("ENABLE!!!")
        } else {
            print("KONTOL!!!")
        }
    }
}

// MARK: - Extensions -
extension ARListPresenter: ARListPresenterInterface {
        
    func numberOfRows() -> Int {
        return arDatas.count
    }
    
    func getArData(atIndex index: Int) -> ARData {
        return arDatas[index]
    }
    
    func onTapList(atIndex index: Int) {
        _router?.navigate(to: .arScreen(arDatas[index]))
    }
}
