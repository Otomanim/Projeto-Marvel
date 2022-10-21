//
//  SearchHomeVC.swift
//  Projeto-Marvel
//
//  Created by Jhonathan Mattos on 28/08/21.
//  Recreation by Evandro Minamoto on 30/10/21.

import Foundation
import UIKit
import Alamofire


class SeriesViewController: UIViewController {
    var seriesController = SeriesController()
    
    @IBOutlet weak var seriesTableView: UITableView!

    @IBOutlet weak var seriesSearchBar: UISearchBar!
    
    @IBOutlet weak var voltarButton: UIButton!
    
    override func viewDidLoad() {
        
        self.seriesTableView.delegate = self
        self.seriesTableView.dataSource = self
        self.seriesTableView.register(UINib(nibName: "SeriesTableViewCell", bundle: nil), forCellReuseIdentifier: "SeriesTableViewCell")
        
        self.seriesSearchBar.borderView(bordeColor: UIColor.init(cgColor: CGColor(red: 212, green: 208, blue: 207, alpha: 0.5)), borderWidth: 1)
        self.seriesSearchBar.layer.cornerRadius = 10
        self.seriesSearchBar.searchTextField.textColor = .white
        self.seriesSearchBar.delegate = self
        
        self.seriesController.getSeries(title: nil) {result, error in
            if result{
                print("============SERIES ========Data OK=============")
                self.seriesTableView.reloadData()
            }else{
                print(error)
            }
        }
    }
    @IBAction func tappedButton(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeLoginViewController", sender: nil)
    }
}

//MARK: - Cell Methods

extension SeriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.seriesController.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SeriesTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "SeriesTableViewCell", for: indexPath) as? SeriesTableViewCell
        cell?.setup(value: seriesController.getCharacter(indexPath: indexPath))
        return cell ?? UITableViewCell()
        
    }
    
    
    
}
extension SeriesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        seriesController.getSeries(title: self.seriesSearchBar.text) { result, error in
            if result {
                self.seriesTableView.reloadData()
            } else {
                print(error)
            }
        }
    }
    
}
