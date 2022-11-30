//
//  FruitCell.swift
//  PG5601_eksamen
//
//  Created by jonathan solheim on 20/11/2022.
//

import UIKit

class FruitCell: UITableViewCell{
    var safeArea: UILayoutGuide!
    var imageIV = UIImageView()
    let nameLabel = UILabel()
    let familyLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        safeArea = layoutMarginsGuide
        setupImageView()
        setupNameLabel()
        setupFamilyLabel()
    }
    
    func setupImageView(){
        addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imageIV.backgroundColor = UIColor.purple
    }
    
    func setupNameLabel(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: imageIV.topAnchor, constant: 5).isActive = true
        
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
    
    func setupFamilyLabel(){
        addSubview(familyLabel)
        
        familyLabel.translatesAutoresizingMaskIntoConstraints = false
        familyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        familyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        familyLabel.font = UIFont(name: "Verdana", size: 14)
    }
}
