//
//  PresenterInterface.swift
//  Common
//
//  Created by Azis Senoaji Prasetyotomo on 13/11/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

public protocol PresenterInterface: class {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
    func set(view: ViewInterface)
    func set(router: RouterInterface)
}

public extension PresenterInterface {
    
    func viewDidLoad() { }
    
    func viewWillAppear(animated: Bool) { }
    
    func viewDidAppear(animated: Bool) { }
    
    func viewWillDisappear(animated: Bool) { }
    
    func viewDidDisappear(animated: Bool) { }
    
}
