//
//  CharactersViewModelTest.swift
//  iOSTakeHomeChallengeTests
//
//  Created by Abbut john on 07/06/2021.
//

import XCTest
@testable import iOSTakeHomeChallenge

class CharactersViewModelTest: XCTestCase {

    var viewModel = CharactersViewModel()

    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testCallFuncToGetValidCharectersData() {
        
        let route = Router.getCharecters
        let expectations = self.expectation(description: "GetCharectersData")

        NetworkService.request(router: route) { (result: Result<[Character], Error>) in
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
    
    func testTextSearch() {
        
        let character1 = Character(url: "", name: "abc1", gender: "", culture: "abc", born: "abc", died: "abc", aliases: [], father: "", mother: "", spouse: "", allegiances: [], books: [], povBooks: [], tvSeries: ["Season 1"], playedBy: [])
        let character2 = Character(url: "", name: "abc2", gender: "", culture: "abc", born: "abc", died: "abc", aliases: [], father: "", mother: "", spouse: "", allegiances: [], books: [], povBooks: [], tvSeries: ["Season 1"], playedBy: [])
        let character3 = Character(url: "", name: "abc3", gender: "", culture: "abc", born: "abc", died: "abc", aliases: [], father: "", mother: "", spouse: "", allegiances: [], books: [], povBooks: [], tvSeries: ["Season 1"], playedBy: [])
        let character4 = Character(url: "", name: "abc4", gender: "", culture: "abc", born: "abc", died: "abc", aliases: [], father: "", mother: "", spouse: "", allegiances: [], books: [], povBooks: [], tvSeries: ["Season 1"], playedBy: [])
        
        var searchArray = [character1, character2, character3, character4]
        
        searchArray = searchArray.filter({ $0.name.hasPrefix("abc1") })
        
        XCTAssertEqual(searchArray, [character1])
        
    }
    
    func testCharactersCellViewModel() {
        
        let character = Character(url: "", name: "abc", gender: "", culture: "abc", born: "abc", died: "abc", aliases: [], father: "", mother: "", spouse: "", allegiances: [], books: [], povBooks: [], tvSeries: ["Season 1"], playedBy: [])
        
        let charactersCellViewModel =  CharactersCellViewModel(character: character)
        
        XCTAssertEqual(character.name, charactersCellViewModel.name)
        XCTAssertEqual(character.culture, charactersCellViewModel.culture)
        XCTAssertEqual(character.born, charactersCellViewModel.born)
        XCTAssertEqual(character.died, charactersCellViewModel.died)
        XCTAssertEqual(character.died, charactersCellViewModel.died)
        XCTAssertEqual(charactersCellViewModel.season, "I ")
    }

}
