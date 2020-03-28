//
//  MySection.swift
//  coronavirus
//
//  Created by Лев Бондаренко on 29.03.2020.
//  Copyright © 2020 Лев Бондаренко. All rights reserved.
//

import Foundation
import RxDataSources

struct MySection {
    var header: String
    var items: [Item]
}

extension MySection : AnimatableSectionModelType {
    typealias Item = String

    var identity: String {
        return header
    }

    init(original: MySection, items: [Item]) {
        self = original
        self.items = items
    }
}
