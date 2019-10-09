//
//  UIStoryboard+Viper.swift
//  Common
//
//  Created by Azis Senoaji Prasetyotomo on 13/11/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    public func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
    
}
