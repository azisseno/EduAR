//
//  ARListInteractor.swift
//  EduAR
//
//  Created by Chandra Welim on 21/10/19.
//  Copyright © 2019 iic. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import Foundation
import Common

final class ARListInteractor {
    
    weak var presenter: ARListPresenterInterface!
}

// MARK: - Extensions -
extension ARListInteractor: ARListInteractorInterface {
    
    func fetchARList() {
        let arDatas: [ARData] = [
            ARData(image: "", title: "JATIWARNA"),
            ARData(image: "", title: "EMERALD TOWER")
        ]
        presenter.arListFetched(arDatas: arDatas)
    }
}
