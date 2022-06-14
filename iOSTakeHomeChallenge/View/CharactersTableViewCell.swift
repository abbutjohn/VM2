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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupWith(character: Character) {
        
        nameLabel.text = character.name
        cultureLabel.text = character.culture
        bornLabel.text = character.born
        diedLabel.text = character.died
        
        var seasons: String = ""
        
        for season in character.tvSeries {
            if season == "Season 1" {
                seasons.append("I ")
            } else if season == "Season 2" {
                seasons.append("II, ")
            } else if season == "Season 3" {
                seasons.append("III, ")
            } else if season == "Season 4" {
                seasons.append("IV, ")
            } else if season == "Season 5" {
                seasons.append("V, ")
            } else if season == "Season 6" {
                seasons.append("VI, ")
            }  else if season == "Season 7" {
                seasons.append("VII, ")
            } else if season == "Season 8" {
                seasons.append("VIII")
            }
        }
        seasonLabel.text = seasons
    }
}
