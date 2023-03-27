//
//  FavouriteViewController.swift
//  Contacts-RxSwift
//
//  Created by prama niyogi on 24/03/23.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet weak var favouriteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func addButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createContactVC = storyboard.instantiateViewController(withIdentifier: "CreateContact") as! CreateContactsViewController
        self.navigationController?.pushViewController(createContactVC, animated: true)
    }
    

}
