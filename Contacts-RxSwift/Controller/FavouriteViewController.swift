//
//  FavouriteViewController.swift
//  Contacts-RxSwift
//
//  Created by prama niyogi on 24/03/23.
//

import UIKit
import RxSwift
import RxCocoa

class FavouriteViewController: UIViewController {

    @IBOutlet weak var favouriteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
dataBinding()
        
    }
   
    func dataBinding(){
        AddContactDetails.sharedInstance.fetchFavourites().bind(to: favouriteTableView.rx.items(cellIdentifier: "FavouritesCell", cellType: FavouritesCell.self)){ [self] (_, list, cell) in
            cell.favouriteName.text = list.name
            cell.favouriteNumber.text = list.phone
            cell.favouriteEmail.text = list.email
          //  cell.favouriteImage.image = list.favImage as? UIImage
            
        }
        
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createContactVC = storyboard.instantiateViewController(withIdentifier: "CreateContact") as! CreateContactsViewController
        self.navigationController?.pushViewController(createContactVC, animated: true)
    }
    

}
