//
//  DataBase.swift
//  Personel Info form
//
//  Created by Burak Altunoluk on 03/08/2022.
//

import Foundation

var contacts = AllContact()

struct AllContact {
    

    
 var contactsArray = [PersonalInformation]()
    
    mutating func addNewContact(newName: String, newSurname: String, newBirthday: String, newHaveLandline: Bool, newLandlineNo: Int, newPhoneNumber: Int, newPostcode: String, newAdresseInfo: String, newProfession: String, newHaveCitizinship: Bool, newCitizinshipNo: Int, newPasportNo: Int, newHaveDriverlicance: Bool, newDriverLicanceNo: Int) {
        
        let newContact = PersonalInformation(name: newName, surname: newSurname, dateOfBirth: newBirthday, haveYouLandline: newHaveLandline, landlinenumber: newLandlineNo, phoneNumber: newPhoneNumber, postCode: newPostcode, adresseInfo: newAdresseInfo, profession: newProfession, haveYouGotCitizinship: newHaveCitizinship, ukCitizinshipNo: newCitizinshipNo, pasaportNo: newPasportNo, haveYouGotDriverLicance: newHaveDriverlicance, ukDriverlicanceNo: newDriverLicanceNo)
        
        contactsArray.append(newContact)
    }
    
    func deleteAllData() {
        contacts.contactsArray.removeAll()
    }
    
    
}



