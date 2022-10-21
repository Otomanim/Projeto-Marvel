//
//  CharactesDetailViewController.swift
//  Projeto-Marvel
//
//  Created by Jhonathan Mattos on 16/11/21.
//

import UIKit
import SDWebImage

class CharactesDetailViewController: UIViewController {
    
    @IBOutlet weak var charactersImageView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var nameCharacterLabel: UILabel!

    var name: String? = ""
    var detail: String? = ""
    var id: Int? = 0
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(value: Character(id: id ?? 0, name: name ?? "", description: detail ?? "", thumbnail: ["" : ""] ?? ["" : ""]))
//        self.nameCharacterLabel.text = name
//        self.detailsLabel.text = detail
    }
    

    
    func setup(value: Character){
        self.nameCharacterLabel.text = value.name
        self.nameCharacterLabel.adjustsFontSizeToFitWidth = true
        let url = extractImage(data: value.thumbnail)
        self.charactersImageView.sd_setImage(with: url)
    }
    
    
    func extractImage(data: [String: String]) ->URL? {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")
    }
    
}
