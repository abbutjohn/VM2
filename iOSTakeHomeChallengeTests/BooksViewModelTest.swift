//
//  BooksViewModelTest.swift
//  iOSTakeHomeChallengeTests
//
//  Created by Abbut john on 06/06/2021.
//

import XCTest
@testable import iOSTakeHomeChallenge

class BooksViewModelTest: XCTestCase {
    
    var viewModel = BooksViewModel()

    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testCallFuncToGetValidBooksData() {
        
        let route = Router.getBooks
        let expectations = self.expectation(description: "GetBooksData")

        NetworkService.request(router: route) { (result: Result<[Book], Error>) in
            // ASSERT
            switch result {
            case .success(let result):
                XCTAssertNotNil(result)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectations.fulfill()
        }
        waitForExpectations(timeout: 0.01, handler: nil)
    }
    
    func testBookCellViewModel() {
        
        let book = Book(url: "", name: "abc", isbn: "", authors: [], numberOfPages: 100, publisher: "", country: "", mediaType: "", released: "1996-08-01T00:00:00", characters: [])
        let bookCellViewMode = BookCellViewModel(book: book)
        
        XCTAssertEqual(book.name, bookCellViewMode.name)
        XCTAssertEqual(bookCellViewMode.dateString, "Aug 1996")
        XCTAssertEqual(bookCellViewMode.pagesLabel, "100 pages")
    }
}
