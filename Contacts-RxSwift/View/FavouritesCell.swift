//
//  FavouritesCell.swift
//  Contacts-RxSwift
//
//  Created by prama niyogi on 05/04/23.
//

import UIKit

class FavouritesCell: UITableViewCell {

    @IBOutlet weak var favouriteImage: UIImageView!
    
    @IBOutlet weak var favouriteEmail: UILabel!
    @IBOutlet weak var favouriteNumber: UILabel!
    @IBOutlet weak var favouriteName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
