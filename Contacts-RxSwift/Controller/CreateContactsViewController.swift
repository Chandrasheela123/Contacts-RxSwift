//
//  CreateContactsViewController.swift
//  Contacts-RxSwift
//
//  Created by Chandrasheela Hotkar on 24/03/23.
//

import UIKit
import RxSwift
import RxCocoa

class CreateContactsViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    @IBOutlet weak var emailIDTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var contactNumberTextField: UITextField!
    @IBOutlet weak var contactNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home Dir: \(NSHomeDirectory())")
        bindDataToTextFields()

        // Do any additional setup after loading the view.
    }
    
    func bindDataToTextFields() {
        
        contactNameTextField.rx.text.bind(to: ContactDetailsViewModel.contactDetailsInstance.nameSubject).disposed(by: disposeBag)
        
        contactNumberTextField.rx.text.bind(to: ContactDetailsViewModel.contactDetailsInstance.phoneNumberSubject).disposed(by: disposeBag)
        emailIDTextField.rx.text.bind(to: ContactDetailsViewModel.contactDetailsInstance.emailSubject).disposed(by: disposeBag)
        
        
    }
    
    @IBAction func createButton(_ sender: Any) {
        
        let name = contactNameTextField.text ?? ""
        let email = emailIDTextField.text ?? ""
        let phoneNumber = contactNumberTextField.text ?? ""
        
        let result = AddContactDetails().saveDetails(name: name, email: email, phoneNum: phoneNumber)
        print(result)
        
        
    }
    @IBAction func cancleButton(_ sender: Any) {
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
