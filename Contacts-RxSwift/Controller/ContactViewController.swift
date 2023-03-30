//
//  ContactViewController.swift
//  Contacts-RxSwift
//
//  Created by prama niyogi on 24/03/23.
//

import UIKit
import CoreData

class ContactViewController: UIViewController {

    @IBOutlet weak var contactTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleTextAttribute = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        
        if let items = self.tabBarController?.tabBar.items {
            for item in items {
                item.setTitleTextAttributes(titleTextAttribute, for: .normal)
                
            }
        }
      
        
    }
    
    

    
    @IBAction func addButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createContactVC = storyboard.instantiateViewController(withIdentifier: "CreateContact") as! CreateContactsViewController
        self.navigationController?.pushViewController(createContactVC, animated: true)
    }
    

}

