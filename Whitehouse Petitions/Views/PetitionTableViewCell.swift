//
//  PetitionTableViewCell.swift
//  Whitehouse Petitions
//
//  Created by Admin on 7/4/22.
//

import UIKit

class PetitionTableViewCell: UITableViewCell {

    static let identifier = "cell"
    
    var title : UILabel = {
       var title = UILabel()
        title.font = .systemFont(ofSize: 10, weight: .medium)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    var subtitle : UILabel = {
       var subtitle = UILabel()
        subtitle.font = .systemFont(ofSize: 10, weight: .light)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.numberOfLines = 1
        return subtitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        
        addSubview(title)
        addSubview(subtitle)
    
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            title.heightAnchor.constraint(equalToConstant: 15),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}
