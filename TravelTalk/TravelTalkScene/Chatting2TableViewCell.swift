//
//  Chatting2TableViewCell.swift
//  TravelTalk
//
//  Created by t2023-m0032 on 6/4/24.
//

import UIKit

class Chatting2TableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: [UIImageView]!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
