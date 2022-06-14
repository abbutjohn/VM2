//
//  HousesViewController.swift
//  iOSTakeHomeChallenge
//
//  Created by James Malcolm on 09/03/2021.
//

import UIKit

class HousesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var filteredData: [House] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var cachedHouses: [House] = [] {
        didSet {
            filteredData = cachedHouses
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.request(router: Router.getHouses) { (result: Result<[House], Error>) in
            switch result {
            case .success(let resultValue):
                self.cachedHouses = resultValue
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
extension HousesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseTableViewCell") as! HouseTableViewCell
        cell.setupWith(house: filteredData[indexPath.row])
        return cell
    }
}

extension HousesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty == false {
            filteredData = cachedHouses.filter({ $0.name.hasPrefix(searchText) })
        }
    }
}



