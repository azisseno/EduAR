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
        _presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _presenter.viewWillAppear(animated: animated)
    }
	
    // MARK: - Setup Initial View
    private func _setupView() {
        // Write your initial setup here
        tableView.register(UINib(nibName: "ARListCell", bundle: .main), forCellReuseIdentifier: "ARListCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        overrideUserInterfaceStyle = .light
        
        // SliderView
        sliderView.value = 1
        sliderView.minimumValue = 1
        sliderView.maximumValue = 10
        sliderLabel.text = sliderString

    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var footerView: UIView!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBAction func sliderAction(_ sender: Any) {
        sliderLabel.text = sliderString
    }
    
    var sliderString: String {
        return "\(ceilf(sliderView.value)) x"
    }
    
}

extension ARListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ARListCell", for: indexPath as IndexPath) as! ARListCell
        cell.setup(data: _presenter.getArData(atIndex: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _presenter.onTapList(atIndex: indexPath.row, scale: ceilf(sliderView.value))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.frame.height - 220) / 2
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
}

// MARK: - Extensions -
extension ARListViewController: ARListViewInterface {
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension ARListViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        _presenter.onModaDismiss()
    }
}
