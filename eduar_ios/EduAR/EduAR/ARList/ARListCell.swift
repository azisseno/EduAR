//
//  ARListCell.swift
//  EduAR
//
//  Created by ven5ch on 21/10/19.
//  Copyright © 2019 iic. All rights reserved.
//

import UIKit

struct ARData {
    var image: String?
    var title: String?
}

class ARListCell: UITableViewCell {

    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(data: ARData) {
        titleLabel.text = data.title
        imageProduct.image = UIImage(named: data.image ?? "")
    }
}
