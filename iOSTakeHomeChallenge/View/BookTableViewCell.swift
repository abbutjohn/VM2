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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupWith(book: Book) {
        titleLabel.text = book.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date (from: book.released){
            dateLabel.text = date.getFormattedDate(format: "MMM yyyy")
        }
        pagesLabel.text =  String(book.numberOfPages) + " " + "pages"
    }
}
extension Date {
    
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
