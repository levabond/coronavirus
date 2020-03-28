//
//  HomeViewController.swift
//  coronavirus
//
//  Created by Лев Бондаренко on 28.03.2020.
//  Copyright (c) 2020 Лев Бондаренко. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import PinLayout

class HomeViewController: UIViewController {
    
    // MARK: TableView
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
//        tableView.delegate = self
//        tableView.dataSource = self
        
        return tableView
    }()
    
    let disposeBag = DisposeBag()

    var dataSource: RxTableViewSectionedAnimatedDataSource<MySection>?
    
    // MARK: Injections
    var presenter: HomePresenterInput!
    var configurator: HomeConfigurable!

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        configurator = HomeConfigurator()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupTableView()
    }
    
    // MARK: Setup
    
    private func setupViews() {
        [tableView].forEach { view.addSubview($0) }
    }
    
    private func setupTableView() {
        tableView.register(HomeCell.self, forCellReuseIdentifier: "Cell")
        tableView.pin.all()
        tableView.estimatedRowHeight = 55
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)

        let dataSource = RxTableViewSectionedAnimatedDataSource<MySection>(
            configureCell: { ds, tv, _, item in
                let cell = tv.dequeueReusableCell(withIdentifier: "Cell") as! HomeCell
                cell.descLabel.text = item

                return cell
            }
        )
        
        self.dataSource = dataSource

        let sections = [
            MySection(header: "Home", items: [
                "Hero"
            ])
        ]
        
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}

// MARK: - HomePresenterOutput
extension HomeViewController: HomePresenterOutput {

}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: 10)
        
        UIView.animate(withDuration: 0.3) {
            cell.alpha = 1
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
}


