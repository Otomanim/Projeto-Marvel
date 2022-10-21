//
//  EventsViewController.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 29/11/21.
//

import UIKit

class EventsCollectionVC: UIViewController {
    
    var eventsController = EventsController()
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    @IBOutlet weak var eventsSearchBar: UISearchBar!
    @IBOutlet weak var voltarButton: UIButton!
    override func viewDidLoad() {
        
        
        
        self.eventsCollectionView.dataSource = self
        self.eventsCollectionView.register(UINib(nibName: "EventsCollectionViewCell", bundle: nil),
                                           forCellWithReuseIdentifier: "EventsCollectionViewCell")
        
        self.eventsSearchBar.borderView(bordeColor: UIColor.init(cgColor: CGColor(red: 212, green: 208, blue: 207, alpha: 0.5)), borderWidth: 1)
        self.eventsSearchBar.layer.cornerRadius = 10
        self.eventsSearchBar.searchTextField.textColor = .white
        self.eventsSearchBar.delegate = self
        
        self.eventsController.getEvents(title: nil) { result, error in
            if result {
                print("============= Events ============ Data Ok ================")
                self.eventsCollectionView.reloadData()
            } else {
                print (error)
            }
        }
    }
    @IBAction func tappedButton(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeLoginViewController", sender: nil)
    }
    
    
}

extension EventsCollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.eventsController.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EventsCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCollectionViewCell", for: indexPath) as? EventsCollectionViewCell
        cell?.setup(value: eventsController.getCharacter(indexPath: indexPath))

        return cell ?? UICollectionViewCell()
    }
}
extension EventsCollectionVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        eventsController.getEvents(title: self.eventsSearchBar.text) { result, error in
            if result {
                self.eventsCollectionView.reloadData()
            } else {
                print (error)
            
            }
        }
    }
}
