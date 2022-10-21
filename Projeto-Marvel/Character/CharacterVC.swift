//
//  HomeVC.swift
//  Projeto-Marvel
//
//  Created by Jhonathan Mattos on 28/08/21.
//  Recreation by Evandro Minamoto on 30/10/21.

import Foundation
import UIKit


class CharacterVC: UIViewController {
    
    let characterController = CharacterController()
    var id:IndexPath = IndexPath(row: 0, section: 0)
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var characterSearchBar: UISearchBar!
    @IBOutlet weak var voltarButton: UIButton!
    
    override func viewDidLoad() {
        self.characterSearchBar.borderView(bordeColor: UIColor.init(cgColor: CGColor(red: 212, green: 208, blue: 207, alpha: 0.5)), borderWidth: 1)
        self.characterSearchBar.layer.cornerRadius = 10
        
        
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.characterSearchBar.delegate = self
        self.homeTableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterTableViewCell")
        self.characterController.networkCharacters(name: nil) { result, error in
            if result{
                print("Data OK")
                self.homeTableView.reloadData()
            }else{
                print(error)
            }
        }
    }

    @IBAction func tappedButton(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeLoginViewController", sender: nil)
    }
}

// MARK: - Cell Methods 
extension CharacterVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterController.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CharacterTableViewCell? = homeTableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell
        cell?.setup(value: characterController.getCharacter(indexPath: indexPath))
        cell?.layer.borderWidth = 1
        cell?.layer.borderColor = UIColor.darkGray.cgColor
        cell?.layer.cornerRadius = 10.0 
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetail", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
                    let dvc = segue.destination as! CharactesDetailViewController
            dvc.name = ""
            dvc.detail = ""
        }
    }
}


extension CharacterVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        characterController.networkCharacters(name: self.characterSearchBar.text) { result, error in
            if result{
                self.homeTableView.reloadData()
            }else{
                print(error)
            }
        }
    }
}
