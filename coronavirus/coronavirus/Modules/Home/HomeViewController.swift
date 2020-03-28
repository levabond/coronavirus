//
//  HomeViewController.swift
//  coronavirus
//
//  Created by Лев Бондаренко on 28.03.2020.
//  Copyright (c) 2020 Лев Бондаренко. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Outlets
    
    // MARK: Injections
    var presenter: HomePresenterInput!
    var configurator: HomeConfigurable!

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator = HomeConfigurator()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
        view.backgroundColor = .white
    }

}

// MARK: - HomePresenterOutput
extension HomeViewController: HomePresenterOutput {

}
