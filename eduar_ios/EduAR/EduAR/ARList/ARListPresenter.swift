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
        _checkEnableDisableApp()
    }
    
    private func _checkEnableDisableApp() {
        _interactor.checkRemoteConfigAppEnabled { [weak self] in
            guard let `self` = self else { return }
            self._enableDisableApp()
        }
        _enableDisableApp()
    }
    
    private func _enableDisableApp() {
        if !_interactor.appEnabled() {
            _router?.navigate(to: .errorScreen)
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
    
    func onTapList(atIndex index: Int, scale: Float) {
        _checkEnableDisableApp()
        _router?.navigate(to: .arScreen(data: arDatas[index],
                                        scale: scale))
    }
    
    func onModaDismiss() {
        _checkEnableDisableApp()
    }
}
