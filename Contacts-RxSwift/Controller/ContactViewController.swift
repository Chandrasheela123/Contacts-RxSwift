//
//  ContactViewController.swift
//  Contacts-RxSwift
//
//  Created by prama niyogi on 24/03/23.
//

import UIKit

class ContactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let titleTextAttribute = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        
        if let items = self.tabBarController?.tabBar.items {
            for item in items {
                item.setTitleTextAttributes(titleTextAttribute, for: .normal)
            
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
