//
//  ContactInfoVC.swift
//  Personel Info form
//
//  Created by Burak Altunoluk on 02/08/2022.
//

import UIKit

class ContactInfoVC: UIViewController {
    
    
    @IBOutlet var submitButtonOutlet: UIButton!
    var rowNumber = -1
    @IBOutlet var citizenshipSwicthOutlet: UISwitch!
    @IBOutlet var driverLicanceSwitchOutlet: UISwitch!
    @IBOutlet var landlineSwitchOutlet: UISwitch!
    @IBOutlet var mainStackView: UIStackView!
    @IBOutlet var contactNameText: UITextField!
    @IBOutlet var contactSurnameText: UITextField!
    @IBOutlet var contactDateOfBirthText: UITextField!
    @IBOutlet var contactAdresseText: UITextField!
    @IBOutlet var contactPostcodeText: UITextField!
    @IBOutlet var contactPhoneNumberText: UITextField!
    @IBOutlet var contactProfessionText: UITextField!
    @IBOutlet var contactLandlineText: UITextField!
    @IBOutlet var contactDriverLicanceText: UITextField!
    @IBOutlet var contactCitizenshipText: UITextField!
    @IBOutlet var contactPasaportText: UITextField!
    
    @IBAction func landlineHaveSwitch(_ sender: Any) {
        switch contactLandlineText.isHidden {
        case true: contactLandlineText.isHidden = false
        case false: contactLandlineText.isHidden = true
        }
    }
    
    @IBAction func driverLicanceHaveSwitch(_ sender: Any) {
        switch contactDriverLicanceText.isHidden {
        case true: contactDriverLicanceText.isHidden = false
        case false: contactDriverLicanceText.isHidden = true
        }
    }
    
    @IBAction func citizenshipHaveSwitch(_ sender: Any) {
        if ((sender as AnyObject).isOn == true) {
            contactPasaportText.isHidden = true
            contactCitizenshipText.isHidden = false
//            contactPasaportText.isEnabled = false
//            contactPasaportText.backgroundColor = .clear
//            contactPasaportText.text = ""
//            contactCitizenshipText.isEnabled = true
//            contactCitizenshipText.backgroundColor = .white
        } else {
            contactCitizenshipText.isHidden = true
            contactPasaportText.isHidden = false
//            contactPasaportText.isEnabled = true
//            contactPasaportText.backgroundColor = .white
//            contactCitizenshipText.isEnabled = false
//            contactCitizenshipText.backgroundColor = .clear
//            contactCitizenshipText.text = ""
        }
    }
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        if submitButtonOutlet.titleLabel?.text == "Submit" {
            print("kayitlarda")
            if landlineSwitchOutlet.isOn == false {
                contactLandlineText.text = "0"}
            if driverLicanceSwitchOutlet.isOn == false {
                contactDriverLicanceText.text = "0"
            }
            if citizenshipSwicthOutlet.isOn == false {
                contactCitizenshipText.text = "0"
            }
                
                
            contacts.addNewContact(newName: contactNameText.text!, newSurname: contactSurnameText.text!, newBirthday: contactDateOfBirthText.text!, newHaveLandline: landlineSwitchOutlet.isOn, newLandlineNo: Int(contactLandlineText.text!)!, newPhoneNumber: Int(contactPhoneNumberText.text!)!, newPostcode: contactPostcodeText.text!, newAdresseInfo: contactAdresseText.text!, newProfession: contactProfessionText.text!, newHaveCitizinship: citizenshipSwicthOutlet.isOn, newCitizinshipNo: Int(contactCitizenshipText.text!)!, newPasportNo: Int(contactPasaportText.text!)!, newHaveDriverlicance: driverLicanceSwitchOutlet.isOn, newDriverLicanceNo: Int(contactDriverLicanceText.text!)!)
            
        }
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
      
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupKeyboardHiding()
        contactCitizenshipText.isHidden = true
     mainStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        contactLandlineText.isHidden = true
        contactDriverLicanceText.isHidden = true
        
        if rowNumber != -1 {
            submitButtonOutlet.setTitle("Edit", for: .normal)
        contactDriverLicanceText.isHidden = true
        contactLandlineText.isHidden = true
            
            citizenshipSwicthOutlet.isOn = contacts.contactsArray[rowNumber].haveYouGotCitizinship
            landlineSwitchOutlet.isOn = contacts.contactsArray[rowNumber].haveYouLandline
            driverLicanceSwitchOutlet.isOn = contacts.contactsArray[rowNumber].haveYouGotDriverLicance
            
        contactNameText.text = contacts.contactsArray[rowNumber].name
        contactSurnameText.text = contacts.contactsArray[rowNumber].surname
        contactDateOfBirthText.text = contacts.contactsArray[rowNumber].dateOfBirth
        contactAdresseText.text = contacts.contactsArray[rowNumber].adresseInfo
        contactPostcodeText.text = contacts.contactsArray[rowNumber].postCode
        contactPhoneNumberText.text = String(contacts.contactsArray[rowNumber].phoneNumber)
        contactProfessionText.text = contacts.contactsArray[rowNumber].profession
        
        if contacts.contactsArray[rowNumber].landlinenumber != 0 {
            contactLandlineText.isHidden = false
            contactLandlineText.text = String(contacts.contactsArray[rowNumber].landlinenumber)
        }
        
        if contacts.contactsArray[rowNumber].ukDriverlicanceNo != 0 {
            contactDriverLicanceText.isHidden = false
            contactDriverLicanceText.text = String(contacts.contactsArray[rowNumber].ukDriverlicanceNo)
        }
        
        if contacts.contactsArray[rowNumber].pasaportNo != 0 {
            contactPasaportText.isHidden = false
            contactCitizenshipText.isHidden = true
            //contactCitizenshipText.backgroundColor = .clear
            contactPasaportText.text = String(contacts.contactsArray[rowNumber].pasaportNo)
        }
        
        if contacts.contactsArray[rowNumber].ukCitizinshipNo != 0 {
            contactCitizenshipText.isHidden = false
            contactPasaportText.isHidden = true
            
           // contactPasaportText.backgroundColor = .clear
            contactCitizenshipText.text = String(contacts.contactsArray[rowNumber].ukCitizinshipNo)
        }
        
    }
}

   

}

extension ContactInfoVC {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        view.frame.origin.y = 0
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            view.frame.origin.y -= keyboardHeight
            
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}
