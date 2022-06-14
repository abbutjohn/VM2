//
//  CharactersTableViewCell.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 05/06/2021.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cultureLabel: UILabel!
    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var diedLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    
    var viewModel: CharactersCellViewModel!{
        didSet {
            nameLabel.text = viewModel.name
            cultureLabel.text = viewModel.culture
            bornLabel.text = viewModel.born
            diedLabel.text = viewModel.died
            seasonLabel.text = viewModel.season
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
