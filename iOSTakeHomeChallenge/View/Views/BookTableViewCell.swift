//
//  BookTableViewCell.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 05/06/2021.
//

import UIKit

class BooksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pagesLabel: UILabel!
    
    var viewModel: BookCellViewModel!{
        didSet {
            titleLabel.text = viewModel.name
            dateLabel.text = viewModel.dateString
            pagesLabel.text = viewModel.pagesLabel
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
