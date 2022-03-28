//
//  CustomTableViewCell.swift
//  WhatsappClone
//
//  Created by Idwall Go Dev 013 on 25/03/22.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {

   static let identifier = "CustomTableViewCell"
    
   lazy var iconImageView: UIImageView = {
       let icon = UIImageView()
       icon.contentMode = .scaleAspectFit
       icon.layer.masksToBounds = true
       icon.layer.cornerRadius = 25
       icon.translatesAutoresizingMaskIntoConstraints = false
       return icon
   }()
    
    lazy var rightImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "chevron.right")
        icon.tintColor = .systemGray
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
   
   lazy var contentVerticalStack: UIStackView = {
       let stack = UIStackView()
       stack.axis = .vertical
       stack.alignment = .top
       stack.spacing = 10
       stack.translatesAutoresizingMaskIntoConstraints = false
       return stack
   }()
   
    lazy var secondContentVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var contentHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .top
        stack.contentMode = .left
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
   
   lazy var titleLabel: UILabel = {
       let label = UILabel()
       label.textColor = .black
       label.font = UIFont.systemFont(ofSize: 14)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   lazy var descriptionLabel: UILabel = {
       let label = UILabel()
       label.textColor = .systemGray
       label.textAlignment = .left
       label.numberOfLines = 2
       label.font = UIFont.systemFont(ofSize: 12)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       
       addSubview(iconImageView)
       
       NSLayoutConstraint.activate([
           iconImageView.widthAnchor.constraint(equalToConstant: 50),
           iconImageView.heightAnchor.constraint(equalToConstant: 50),
           iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
           iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
       ])
       
       addSubview(contentHorizontalStack)
       
       NSLayoutConstraint.activate([
        contentHorizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        contentHorizontalStack.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
        contentHorizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        contentHorizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
       ])
       
       addSubview(contentVerticalStack)
       contentVerticalStack.addArrangedSubview(titleLabel)
       contentVerticalStack.addArrangedSubview(descriptionLabel)
       
       addSubview(secondContentVerticalStack)
       secondContentVerticalStack.addArrangedSubview(dateLabel)
       secondContentVerticalStack.addArrangedSubview(rightImageView)
       
       NSLayoutConstraint.activate([
        secondContentVerticalStack.leadingAnchor.constraint(equalTo: contentVerticalStack.leadingAnchor, constant: 220)
       ])
              
       contentHorizontalStack.addArrangedSubview(contentVerticalStack)
       contentHorizontalStack.addArrangedSubview(secondContentVerticalStack)
       
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

    func setup(with message: Message){
        let url = URL(string: message.picture)
        
        iconImageView.kf.setImage(with: url)
        titleLabel.text = message.name
        descriptionLabel.text = message.lastChat
        dateLabel.text = message.latestTimestamp
    }
}
