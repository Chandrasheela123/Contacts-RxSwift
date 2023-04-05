//
//  CreateContactsViewController.swift
//  Contacts-RxSwift
//
//  Created by Chandrasheela Hotkar on 24/03/23.
//

import UIKit
import RxSwift
import RxCocoa
import CoreData

class CreateContactsViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var favouriteButton: UISwitch!
    @IBOutlet weak var createButton: UIButton!
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
        
        
        createButton.rx.tap.flatMap{ data -> Completable in

            return AddContactDetails().saveDetails(name: self.contactNameTextField.text!, email: self.emailIDTextField.text!, phoneNum: self.contactNumberTextField.text!)

        }.subscribe(onError:{ err in
            print("Error: \(err.localizedDescription)")
        }, onCompleted: {
            print("Data saved")
        })
        
        favouriteButton.rx.isOn.flatMap{ data -> Completable in
            
            return AddContactDetails().saveFavourites(name: self.contactNameTextField.text!, email: self.emailIDTextField.text!, phoneNum: self.contactNumberTextField.text!)

        }.subscribe(onError:{ err in
            print("Error: \(err.localizedDescription)")
        }, onCompleted: {
            print("Data favorite saved")
        })
        
        addImageButton.rx.tap.subscribe(onNext: { [weak self] in
            GalleryManager.galleryInstance.showGallery()
        })
    }
    
    @IBAction func createButton(_ sender: Any) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
        self.navigationController?.popViewController(animated: true)

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
