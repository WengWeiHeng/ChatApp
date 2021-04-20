//
//  ProfileCell.swift
//  ChatApp
//
//  Created by Heng on 2020/6/30.
//  Copyright © 2020 Heng. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    //MARK: - Properties
    var viewModel: ProfileViewModel? {
        didSet{ configure() }
    }
    
    private lazy var iconView: UIView = {
        let view = UIView()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.centerY(inView: view)
        
        view.backgroundColor = .systemPurple
        view.setDimensions(height: 40, width: 40)
        view.layer.cornerRadius = 40 / 2
        
        return view
    }()
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.setDimensions(height: 28, width: 28)
        image.tintColor = .white
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack = UIStackView(arrangedSubviews: [iconView, titleLabel])
        stack.spacing = 8
        stack.axis = .horizontal
        
        addSubview(stack)
        stack.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    func configure() {
        guard let viewModel = viewModel else { return }
        
        iconImage.image = UIImage(systemName: viewModel.iconImageName)
        titleLabel.text = viewModel.description
    }
}
