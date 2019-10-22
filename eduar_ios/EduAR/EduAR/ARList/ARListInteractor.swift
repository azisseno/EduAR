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
import Firebase

final class ARListInteractor { }

// MARK: - Extensions -
extension ARListInteractor: ARListInteractorInterface {
    
    func fetchARList() -> [ARData]  {
        let arDatas: [ARData] = [
            ARData(image: "jatiwarna", title: "JATIWARNA", index: 0),
            ARData(image: "emerald", title: "EMERALD TOWER", index: 1)
        ]
        return arDatas
    }

    func checkRemoteConfigAppEnabled() {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("iiic_ar_config").observeSingleEvent(of: .value) { (snapshot) in
            let string = snapshot.value as! String
            UserDefaults.standard.set(string, forKey: ARListConstant.appEnable)
        }
    }
    
    func appEnabled() -> Bool {
        guard let string = UserDefaults.standard.string(forKey: ARListConstant.appEnable) else {
            return false
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: string) {
            if date < Date() {
                return false
            } else {
                return true
            }
        } else {
            switch string {
            case "enable":
                return true
            case "disable":
                return false
            default:
                return false
            }
        }
    }
}
