//
//  BooksViewModel.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 05/06/2021.
//


import Foundation

//MARK: BooksViewModel

class BooksViewModel : NSObject {
    
    var rowsPerSection: [Int] = [0]
   // private var apiService : NetworkService!
    var cachedBooks: [Book] = [] {
        didSet {
            self.rowsPerSection = [cachedBooks.count]
            self.loadData()
        }
    }
    var loadData : (() -> ()) = {}
    var hideActivityIndicator : (() -> ()) = {}
    
    override init() {
        super.init()
       // self.apiService =  NetworkService()
        self.callFuncToGetBooksData()
    }
    
    func callFuncToGetBooksData() {
        
        APIClient.getBooks{ result in
            switch result {
            case .success(let resultValue):
                self.cachedBooks = resultValue
                self.hideActivityIndicator()
            case .failure(let error):
                print(error.localizedDescription)
                self.hideActivityIndicator()
            }
        }
    }
    
    func viewModelForCell(at index: Int) -> BookCellViewModel {
        return BookCellViewModel(book: cachedBooks[index])
    }
}

//MARK: BookCellViewModel

struct BookCellViewModel {
    
    let name: String
    var dateString: String = K.appConstants.nilString
    let pagesLabel: String
    
    init(book: Book) {
        
        name = book.name
        pagesLabel =  String(book.numberOfPages) + K.appConstants.spaceString + K.appConstants.pages
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = K.appConstants.dateFormatFromServer
        if let date = dateFormatter.date (from: book.released){
            dateString = date.getFormattedDate(format: K.appConstants.dateFormatToShow)
        }
    }
}
