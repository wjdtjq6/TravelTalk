//
//  ChattingTableViewCell.swift
//  TravelTalk
//
//  Created by t2023-m0032 on 6/4/24.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
