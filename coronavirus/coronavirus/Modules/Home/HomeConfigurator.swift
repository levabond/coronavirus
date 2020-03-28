//
//  HomeConfigurator.swift
//  coronavirus
//
//  Created by Лев Бондаренко on 28.03.2020.
//  Copyright (c) 2020 Лев Бондаренко. All rights reserved.
//

import UIKit

protocol HomeConfigurable {
    func configure(viewController: HomeViewController)
}

class HomeConfigurator: HomeConfigurable {

    //MARK: HomeConfigurable
    func configure(viewController: HomeViewController) {
    
        let router = HomeRouter(viewController: viewController)
        
        let presenter = HomePresenter(
            output: viewController,
            router: router
        )
        
        viewController.presenter = presenter

    }
}
