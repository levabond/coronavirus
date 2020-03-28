//
//  HomeRouter.swift
//  coronavirus
//
//  Created by Лев Бондаренко on 28.03.2020.
//  Copyright (c) 2020 Лев Бондаренко. All rights reserved.
//

import UIKit

protocol HomeRoutable: class {
    
}

class HomeRouter {
    
    // MARK: Injections
    weak var viewController: UIViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

// MARK: - HomeRoutable
extension HomeRouter: HomeRoutable {
    
}
