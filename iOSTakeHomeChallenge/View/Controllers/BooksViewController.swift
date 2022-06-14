//
//  BooksViewController.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 05/06/2021.
//

import UIKit

class BooksViewController: UIViewController {
    
    //MARK:   Properties
    
    @IBOutlet weak var tableView: UITableView!
    var activityView: UIActivityIndicatorView?
    var viewModel : BooksViewModel!

    //MARK:   LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.showActivityIndicator()
    }
    
    //MARK:   Binding with ViewModel
    
    func bindViewModel(){
        self.viewModel =  BooksViewModel()
        self.viewModel.loadData = {
            self.tableView.reloadData()
        }
        self.viewModel.hideActivityIndicator = {
            self.hideActivityIndicator()
        }
    }
    
    //MARK:  Funtions

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

//MARK:  TableViewcontroller

extension BooksViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.rowsPerSection[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellConstants.booksTableViewCell) as! BooksTableViewCell
        cell.viewModel = self.viewModel.viewModelForCell(at: indexPath.row)
        return cell
    }
}
