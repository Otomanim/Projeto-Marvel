//
//  EventsCollectionViewCell.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 03/12/21.
//

import UIKit
import SDWebImage

class EventsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var eventsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.eventsImageView.layer.cornerRadius = 20
        self.eventsImageView.borderView(bordeColor: .white, borderWidth: 1.5)
        
    }
    func setup(value: Events){
//        self.titleSeriesLabel.text = value.title
//        print(value)
//        self.titleSeriesLabel.adjustsFontSizeToFitWidth = true
        let url = extractImage(data: value.thumbnail)
        self.eventsImageView.sd_setImage(with: url)
    }
    
    func extractImage(data: [String: String]) ->URL? {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")
    }

}
