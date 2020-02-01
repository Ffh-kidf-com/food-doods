//
//  RecipeCollectionViewCell.swift
//  Food-Doods-Prototype
//
//  Created by Alan Yan on 2019-11-02.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    var recipeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "carrot")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Poutine"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "30 Minutes"
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    var difficultyLabel: UILabel = {
        let label = UILabel()
        label.text = "Easy"
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    var ingredientLabel: UILabel = {
        let label = UILabel()
        label.text = "4/15 Ingredients"
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frame = frame.inset(by: UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5))
        clipsToBounds = true
        layer.masksToBounds = false
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(recipeImage)
        addSubview(nameLabel)
        addSubview(timeLabel)
        addSubview(difficultyLabel)
        addSubview(ingredientLabel)

        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        recipeImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        recipeImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        recipeImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        recipeImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        
        nameLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        difficultyLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor).isActive = true
        difficultyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        difficultyLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        difficultyLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        ingredientLabel.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor).isActive = true
        ingredientLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        ingredientLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        ingredientLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
    }
    
}
