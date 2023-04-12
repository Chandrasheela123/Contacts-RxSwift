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
    
    var detailList : [ContactDetailsEntity] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataBinding()
        
        let titleTextAttribute = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        
        if let items = self.tabBarController?.tabBar.items {
            for item in items {
                item.setTitleTextAttributes(titleTextAttribute, for: .normal)
            
            }
        }
    }
    
    func dataBinding(){
        AddContactDetails.sharedInstance.fetchDetails().bind(to: contactTableView.rx.items(cellIdentifier: "ContactCell", cellType: ContactCell.self)){ [self] (_, list, cell) in
            cell.contactName.text = list.name
            cell.contactNumber.text = list.phoneNumber
            cell.contactImage.image = list.savedImage as? UIImage
        }
    }
   
    var userArry = NSMutableArray()
    func fetchData() {
        let appDelegates = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegates?.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context?.fetch(request)
            print("resultData=" , result as Any)
            for data in result as! [NSManagedObject] {
                userArry.add(data)
            }
            print("userArry!!=" , self.userArry)
        } catch {
            print("failed")
        }
        
        
    }
    
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createContactVC = storyboard.instantiateViewController(withIdentifier: "CreateContact") as! CreateContactsViewController
        self.navigationController?.pushViewController(createContactVC, animated: true)
    }
    

}
