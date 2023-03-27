//
//  ContactCell.swift
//  Contacts-RxSwift
//
//  Created by prama niyogi on 27/03/23.
//

import UIKit

class ContactCell: UITableViewCell {

    
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
