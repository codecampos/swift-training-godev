//
//  PersonTableViewCell.swift
//  App
//
//  Created by Idwall Go Dev 013 on 21/03/22.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var namePersonLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    static let identifier = "PersonTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(photo: String ,name: String, company: String) {
        personImageView.loadImage(from: photo)
        namePersonLabel.text = name
        companyLabel.text = company
        
    }
}
