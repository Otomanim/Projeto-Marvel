//
//  CharacterTableViewCell.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 27/10/21.
//

import UIKit
import SDWebImage


class CharacterTableViewCell:UITableViewCell {
    
    @IBOutlet weak var nameCharacterLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterView: UIView!
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(value: Character){
        self.nameCharacterLabel.text = value.name
        self.nameCharacterLabel.adjustsFontSizeToFitWidth = true
        let url = extractImage(data: value.thumbnail)
        self.characterImageView.sd_setImage(with: url)
    }
    
    func extractImage(data: [String: String]) ->URL? {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")
    }
    
}
