//
//  HousesViewModel.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 05/06/2021.
//

import Foundation

class HousesViewModel : NSObject {
    
//    private var apiService : NetworkService!
    var rowsPerSection: [Int] = [0]
    var cachedHouses: [House] = [] {
        didSet {
            filteredData = cachedHouses
        }
    }
    var filteredData: [House] = [] {
        didSet {
            rowsPerSection = [filteredData.count]
            self.loadData()
        }
    }
    var loadData : (() -> ()) = {}
    var hideActivityIndicator : (() -> ()) = {}
    
    override init() {
        super.init()
//        self.apiService =  NetworkService()
        self.callFuncToGetHousesData()
    }
    
//    func callFuncToGetHousesData() {
//        NetworkService.request(router: Router.getHouses) { (result: Result<[House], Error>) in
//            switch result {
//            case .success(let resultValue):
//                self.cachedHouses = resultValue
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//            self.hideActivityIndicator()
//        }
//    }
    
    func callFuncToGetHousesData() {
        
        APIClient.getHouses{ result in
            switch result {
            case .success(let resultValue):
                self.cachedHouses = resultValue
                self.hideActivityIndicator()
            case .failure(let error):
                print(error.localizedDescription)
                self.hideActivityIndicator()
            }
        }
    }
    
    func viewModelForCell(at index: Int) -> HouseCellViewModel {
        return HouseCellViewModel(house: filteredData[index])
    }
    
    func filterWithSearchText(with searchText: String) {
        filteredData = cachedHouses.filter({ $0.name.hasPrefix(searchText) })
    }
}

//MARK: HouseCellViewModel

struct HouseCellViewModel {
    
    let name: String
    var regionString: String = K.appConstants.nilString
    let wordsString: String
    
    init(house: House) {
        name = house.name
        regionString = house.region
        wordsString = house.words
    }
}
