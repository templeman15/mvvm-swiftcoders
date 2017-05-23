//
//  CarsTableViewCell.swift
//  MVVM SwiftCoders
//
//  Created by Steven Templeman on 5/19/17.
//  Copyright © 2017 Coplex. All rights reserved.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
