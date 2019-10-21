//
//  ARListViewController.swift
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

final class ARListViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: ARListPresenterInterface!
    
    // MARK: - Module Setup -
    func set(presenter: ARListPresenterInterface) {
        _presenter = presenter
    }
    
    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
        _presenter.viewDidLoad()
    }
	
    // MARK: - Setup Initial View
    private func _setupView() {
        // Write your initial setup here
        setupTableView()
        overrideUserInterfaceStyle = .dark
        self.title = "IIIC"
        data.append(ARData(image: "", title: "JATIWARNA"))
        data.append(ARData(image: "", title: "EMERALD TOWER"))
    }
    
    @IBOutlet weak var tableView: UITableView!
    var data: [ARData] = []
}

extension ARListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ARListCell", for: indexPath as IndexPath) as! ARListCell
        cell.setup(data: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - Extensions -
extension ARListViewController: ARListViewInterface {
    func setupTableView() {
        tableView.register(UINib(nibName: "ARListCell", bundle: .main), forCellReuseIdentifier: "ARListCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
    }
}
