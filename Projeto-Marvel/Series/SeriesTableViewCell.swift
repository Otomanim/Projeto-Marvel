//
//  SeriesTableViewCell.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 30/10/21.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {

    @IBOutlet weak var seriesView: UIView!
    @IBOutlet weak var seriesImageView: UIImageView!
    @IBOutlet weak var titleSeriesLabel: UILabel!
    @IBOutlet weak var descriptionSeriesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.seriesView.borderView()
        self.seriesView.layer.cornerRadius = 8
        self.seriesImageView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(value: Series){
        self.titleSeriesLabel.text = value.title
        print(value)
        self.titleSeriesLabel.adjustsFontSizeToFitWidth = true
        let url = extractImage(data: value.thumbnail)
        self.seriesImageView.sd_setImage(with: url)
    }
    
    func extractImage(data: [String: String]) ->URL? {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")
    }
    
}
