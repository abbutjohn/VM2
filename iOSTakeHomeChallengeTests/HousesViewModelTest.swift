//
//  HousesViewModelTest.swift
//  iOSTakeHomeChallengeTests
//
//  Created by Abbut john on 07/06/2021.
//

import XCTest
@testable import iOSTakeHomeChallenge

class HousesViewModelTest: XCTestCase {
    
    var viewModel = HousesViewModel()

    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testCallFuncToGetValidHousesData() {
        
        let route = Router.getHouses
        let expectations = self.expectation(description: "GetHousesData")

        NetworkService.request(router: route) { (result: Result<[House], Error>) in
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
        
        let house1 = House(url: "", name: "abc1", region: "", coatOfArms: "", words: "", titles: [], seats: [], currentLord: "", heir: "", overlord: "", founded: "", founder: "", diedOut: "", ancestralWeapons: [], cadetBranches: [], swornMembers: [])
        let house2 = House(url: "", name: "abc2", region: "", coatOfArms: "", words: "", titles: [], seats: [], currentLord: "", heir: "", overlord: "", founded: "", founder: "", diedOut: "", ancestralWeapons: [], cadetBranches: [], swornMembers: [])
        let house3 = House(url: "", name: "abc3", region: "", coatOfArms: "", words: "", titles: [], seats: [], currentLord: "", heir: "", overlord: "", founded: "", founder: "", diedOut: "", ancestralWeapons: [], cadetBranches: [], swornMembers: [])
        let house4 = House(url: "", name: "abc4", region: "", coatOfArms: "", words: "", titles: [], seats: [], currentLord: "", heir: "", overlord: "", founded: "", founder: "", diedOut: "", ancestralWeapons: [], cadetBranches: [], swornMembers: [])
        
        var searchArray = [house1, house2, house3, house4]
        
        searchArray = searchArray.filter({ $0.name.hasPrefix("abc1") })
        
        XCTAssertEqual(searchArray, [house1])
        
    }
    
    func testHouseCellViewModel() {
        
        let house = House(url: "", name: "abc", region: "", coatOfArms: "", words: "", titles: [], seats: [], currentLord: "", heir: "", overlord: "", founded: "", founder: "", diedOut: "", ancestralWeapons: [], cadetBranches: [], swornMembers: [])
        let houseCellViewModel = HouseCellViewModel(house: house)
        
        XCTAssertEqual(house.name, houseCellViewModel.name)
        XCTAssertEqual(house.region, houseCellViewModel.regionString)
        XCTAssertEqual(house.words, houseCellViewModel.wordsString)
    }
}
