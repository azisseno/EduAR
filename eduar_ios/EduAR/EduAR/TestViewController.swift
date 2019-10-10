//
//  TestViewController.swift
//  EduAR
//
//  Created by azisseno on 10/10/19.
//  Copyright © 2019 iic. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapButton(_ sender: Any) {
        let vc = ARScreenBuilder().main()
        present(vc, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
