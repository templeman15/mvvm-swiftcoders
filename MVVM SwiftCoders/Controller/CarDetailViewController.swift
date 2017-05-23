//
//  CarDetailViewController.swift
//  MVVM SwiftCoders
//
//  Created by Steven Templeman on 5/18/17.
//  Copyright © 2017 Coplex. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CarDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var fuelRemainingLabel: UILabel!
    @IBOutlet weak var testDriveButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private
}
