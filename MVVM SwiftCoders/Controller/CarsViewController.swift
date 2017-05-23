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
    
    var viewModel: CarsViewModel!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - Private
    
    private func bindRx() {
        viewModel = CarsViewModel(provider: RxMoyaProvider<ApiService>(),
                                  search: searchBar.rx.text.orEmpty.asDriver())
        
        viewModel.cars
            .drive(tableView.rx.items) { tableView, indexPath, car in
                let cell = tableView.dequeueReusableCell(withIdentifier: "CarTableViewCell") as! CarsTableViewCell
                cell.modelLabel.text = car.model
                cell.makeLabel.text = car.make
                cell.fuelLabel.text = "\(car.fuelRemaining) tank"
                return cell
        }
        .disposed(by: disposeBag)
        
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        searchBar.rx.searchButtonClicked
            .asDriver()
            .drive(onNext: { [weak self] _ in
                self?.searchBar.endEditing(true)
            })
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Car.self)
            .asDriver()
            .drive(onNext: { [weak self] car in
                let car = car
                let carDetailVC = self?.storyboard?.instantiateViewController(withIdentifier: "CarDetailVC") as! CarDetailViewController
                carDetailVC.car.value = car
                self?.navigationController?.pushViewController(carDetailVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
