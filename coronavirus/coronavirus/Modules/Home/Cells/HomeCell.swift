//
//  HomeCell.swift
//  coronavirus
//
//  Created by Лев Бондаренко on 29.03.2020.
//  Copyright © 2020 Лев Бондаренко. All rights reserved.
//

import UIKit
import PinLayout

class HomeCell: UITableViewCell {
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "TestTestTestTestTestTestTestTestTestTestTestTestTest"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        layer.cornerRadius = 20
        backgroundColor = .white
        [backgroundImageView, descLabel].forEach { contentView.addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout()
        return CGSize(width: size.width, height: descLabel.frame.maxY + 10)
    }
    
    func layout() {
        backgroundImageView.pin.top(10).width(90%).hCenter().height(50)
        descLabel.pin.left(15).marginTop(10).below(of: backgroundImageView).horizontally().sizeToFit(.width)
    }
}
