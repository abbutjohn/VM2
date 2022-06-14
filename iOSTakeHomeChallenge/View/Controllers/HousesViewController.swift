//
//  HousesViewController.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 05/06/2021.
//

import UIKit

class HousesViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    var activityView: UIActivityIndicatorView?
    var viewModel : HousesViewModel!

    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showActivityIndicator()
        self.bindViewModel()
        self.tableView.keyboardDismissMode = .onDrag

    }
    
    //MARK: Binding with ViewModel
    
    func bindViewModel(){
        self.viewModel =  HousesViewModel()
        self.viewModel.loadData = {
            self.tableView.reloadData()
        }
        self.viewModel.hideActivityIndicator = {
            self.hideActivityIndicator()
        }
    }
    
    //MARK: Funtions

    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        activityView?.color = .white
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
}

//MARK: TableViewcontroller

extension HousesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.rowsPerSection[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellConstants.HouseTableViewCell) as! HouseTableViewCell
        cell.viewModel = self.viewModel.viewModelForCell(at: indexPath.row)
        return cell
    }
}

//MARK: SearchController

extension HousesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.viewModel.filterWithSearchText(with: searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
}



