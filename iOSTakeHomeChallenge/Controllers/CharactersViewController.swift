//
//  CharactersViewController.swift
//  iOSTakeHomeChallenge
//
//  Created by James Malcolm on 09/03/2021.
//

import UIKit

class CharactersViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var cachedCharacters: [Character] = [] {
        didSet {
            filteredData = cachedCharacters
        }
    }
    var filteredData: [Character] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.request(router: Router.getCharecters) { (result: Result<[Character], Error>) in
            switch result {
            case .success(let resultValue):
                self.cachedCharacters = resultValue
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension CharactersViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell
        cell.setupWith(character: filteredData[indexPath.row])
        return cell
    }
}

extension CharactersViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty == false {
            filteredData = cachedCharacters.filter({ $0.name.hasPrefix(searchText) })
        }
    }
}



