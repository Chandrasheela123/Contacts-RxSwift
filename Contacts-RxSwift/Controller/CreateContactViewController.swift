//
//  CreateContactViewController.swift
//  Contacts-RxSwift
//
//  Created by Chandrasheela Hotkar on 24/03/23.
//

import UIKit

class CreateContactViewController: UIViewController {

    @IBOutlet weak var emailIDTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var contactNumberTextField: UITextField!
    @IBOutlet weak var contactNameTextField: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createButton(_ sender: Any) {
    }
    @IBAction func cancelButton(_ sender: Any) {
    }
    @IBAction func switchButton(_ sender: Any) {
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

