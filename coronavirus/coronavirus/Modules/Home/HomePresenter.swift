//
//  HomePresenter.swift
//  coronavirus
//
//  Created by Лев Бондаренко on 28.03.2020.
//  Copyright (c) 2020 Лев Бондаренко. All rights reserved.
//

import Foundation

protocol HomePresenterInput: BasePresenterInput {
    var router: HomeRoutable { get }
    func viewDidLoad()
}

protocol HomePresenterOutput: BasePresenterOutput {}

class HomePresenter {
    
    //MARK: Injections
    private weak var output: HomePresenterOutput?
    var router: HomeRoutable
    
    //MARK: LifeCycle 
    init(output: HomePresenterOutput,
         router: HomeRoutable) {
        
        self.output = output
        self.router = router
    }
    
}

// MARK: - HomePresenterInput
extension HomePresenter: HomePresenterInput {
    
    func viewDidLoad() {
        
    }
    
}

