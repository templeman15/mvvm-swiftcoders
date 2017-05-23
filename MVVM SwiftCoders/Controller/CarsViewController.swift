//
//  CarsViewController.swift
//  MVVM SwiftCoders
//
//  Created by Steven Templeman on 5/19/17.
//  Copyright © 2017 Coplex. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya

class CarsViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - Private
}
