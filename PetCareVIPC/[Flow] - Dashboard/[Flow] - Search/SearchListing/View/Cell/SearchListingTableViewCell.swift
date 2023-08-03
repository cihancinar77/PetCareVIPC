//
//  SearchListingTableViewCell.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 24.07.2023.
//

import UIKit

class SearchListingTableViewCell: UITableViewCell {
    
    let cellTextLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadWith(text: String) {
        selectionStyle = .none
        contentView.addSubview(cellTextLabel)
        cellTextLabel.text = text
        NSLayoutConstraint.activate([
            cellTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            cellTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            cellTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
    }

}
