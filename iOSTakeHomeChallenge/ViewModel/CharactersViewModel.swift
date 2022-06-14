//
//  CharactersViewModel.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 05/06/2021.
//

import Foundation

class CharactersViewModel : NSObject {
    
    //private var apiService : NetworkService!
    var rowsPerSection: [Int] = [0]
    var cachedCharacters: [Character] = [] {
        didSet {
            filteredData = cachedCharacters
        }
    }
    var filteredData: [Character] = [] {
        didSet {
            rowsPerSection = [filteredData.count]
            self.loadData()
        }
    }
    var loadData : (() -> ()) = {}
    var hideActivityIndicator : (() -> ()) = {}
    
    override init() {
        super.init()
        //self.apiService =  NetworkService()
        self.callFuncToGetCharectersData()
    }
    
//    func callFuncToGetCharectersData() {
//        NetworkService.request(router: Router.getCharecters) { (result: Result<[Character], Error>) in
//            switch result {
//            case .success(let resultValue):
//                self.cachedCharacters = resultValue
//                self.hideActivityIndicator()
//            case .failure(let error):
//                print(error.localizedDescription)
//                self.hideActivityIndicator()
//            }
//        }
//    }
    
    func callFuncToGetCharectersData() {
        
        APIClient.getCharecters{ result in
            switch result {
            case .success(let resultValue):
                self.cachedCharacters = resultValue
                self.hideActivityIndicator()
            case .failure(let error):
                print(error.localizedDescription)
                self.hideActivityIndicator()
            }
        }
    }
    
    func viewModelForCell(at index: Int) -> CharactersCellViewModel {
        return CharactersCellViewModel(character: filteredData[index])
    }
    
    func filterWithSearchText(with searchText: String) {
        filteredData = cachedCharacters.filter({ $0.name.hasPrefix(searchText) })
    }
}

//MARK: CharactersCellViewModel

struct CharactersCellViewModel {
    
    var name: String = ""
    var culture: String = ""
    var born: String = ""
    var died: String = ""
    var season: String = ""
    
    init(character: Character) {
        
        name = character.name
        culture = character.culture
        born = character.born
        died = character.died
        var seasons :String = K.appConstants.nilString
        
        for season in character.tvSeries {
            if season == K.appConstants.season1 {
                seasons.append("I ")
            } else if season == K.appConstants.season2 {
                seasons.append("II, ")
            } else if season == K.appConstants.season3  {
                seasons.append("III, ")
            } else if season == K.appConstants.season4 {
                seasons.append("IV, ")
            } else if season == K.appConstants.season5 {
                seasons.append("V, ")
            } else if season == K.appConstants.season6 {
                seasons.append("VI, ")
            }  else if season == K.appConstants.season7 {
                seasons.append("VII, ")
            } else if season == K.appConstants.season8 {
                seasons.append("VIII")
            }
        }
        season = seasons
    }
}
