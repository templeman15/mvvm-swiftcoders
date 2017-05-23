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

    var viewModel: CarDetailViewModel!
    let car = Variable<Car?>(nil)
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var fuelRemainingLabel: UILabel!
    @IBOutlet weak var testDriveButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        car.asDriver()
            .filter { $0 != nil }
            .map { $0! }
            .drive(onNext: { [weak self] car in
                guard let `self` = self else { return }
                self.viewModel = CarDetailViewModel(car: car,
                                                     testDriveTapped: self.testDriveButton.rx.tap.asDriver())
                self.bindRx()
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Private
    
    fileprivate func bindRx() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        viewModel.make
            .drive(makeLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.model
            .drive(modelLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.fuelRemaining
            .drive(fuelRemainingLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
