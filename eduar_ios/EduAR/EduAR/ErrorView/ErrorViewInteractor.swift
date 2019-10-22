//
//  ErrorViewInteractor.swift
//  EduAR
//
//  Created by ven5ch on 22/10/19.
//  Copyright © 2019 iic. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import Foundation
import Common
import Firebase

final class ErrorViewInteractor {
}

// MARK: - Extensions -
extension ErrorViewInteractor: ErrorViewInteractorInterface {
    
    func checkRemoteConfigAppEnabled(completion: (() -> ())?) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("iiic_ar_config").observeSingleEvent(of: .value) { (snapshot) in
            if let string = snapshot.value as? String {
                if let currentString = UserDefaults.standard.string(forKey: ARListConstant.appEnable),
                    string == currentString {
                } else {
                    UserDefaults.standard.set(string, forKey: ARListConstant.appEnable)
                    completion?()
                }
            }
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
