//
//  FavouriteCell.swift
//  Contacts-RxSwift
//
//  Created by prama niyogi on 27/03/23.
//

import UIKit

class FavouriteCell: UITableViewCell {

    @IBOutlet weak var favouriteImage: UIImageView!    
    @IBOutlet weak var favouriteName: UILabel!
    @IBOutlet weak var favouriteNumber: UILabel!
    @IBOutlet weak var favouriteEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
