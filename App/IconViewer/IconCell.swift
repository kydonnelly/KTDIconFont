//
//  IconCell.swift
//  IconViewer
//
//  Created by Kyle Donnelly on 3/21/20.
//  Copyright © 2020 Kyle Donnelly. All rights reserved.
//

import UIKit
import KTDIconFont

class IconCell: UITableViewCell {
    
    @IBOutlet private var iconLabel: UILabel!
    @IBOutlet private var iconImageView: UIImageView!
    
    public func setup(icon: KTDIcons) {
        // how to get enum case name?? look up in xib map
        self.iconLabel.text = "\(icon)"
        self.iconImageView.icon = icon
    }
    
}
