//
//  GroupingCell.swift
//  PG5601_eksamen
//
//  Created by jonathan solheim 30/11/2022.
//

import UIKit

class GroupingCell: UICollectionViewCell {

        var safeArea: UILayoutGuide!
        let familyLabel = UILabel()
        let genusLabel = UILabel()
        let orderLabel = UILabel()
        
        var cornerRadius: CGFloat = 5.0
        static let identifier = "GroupingCell"
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupView(){
            safeArea = layoutMarginsGuide
            setupFamilyLabel()
            setupGenusLabel()
            setupOrderLabel()
        }
      
        func setupFamilyLabel(){
            addSubview(familyLabel)
            
            familyLabel.translatesAutoresizingMaskIntoConstraints = false
            familyLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            familyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            familyLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            familyLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
            familyLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
            familyLabel.textAlignment = .center
        }
        
        func setupGenusLabel(){
            addSubview(genusLabel)
            
            genusLabel.translatesAutoresizingMaskIntoConstraints = false
            genusLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
            genusLabel.topAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
            
            genusLabel.font = UIFont(name: "Verdana", size: 14)
        }
        
        func setupOrderLabel(){
            addSubview(orderLabel)
            
            orderLabel.translatesAutoresizingMaskIntoConstraints = false
            orderLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
            orderLabel.topAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
            
            orderLabel.font = UIFont(name: "Verdana", size: 14)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            
                    contentView.layer.cornerRadius = cornerRadius
                    contentView.layer.masksToBounds = true

                    layer.cornerRadius = cornerRadius
                    layer.masksToBounds = false
                    
                    layer.shadowRadius = 8.0
                    layer.shadowOpacity = 0.10
                    layer.shadowColor = UIColor.black.cgColor
                    layer.shadowOffset = CGSize(width: 0, height: 5)

            genusLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 50)
            orderLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 80)
        }
        
    }



