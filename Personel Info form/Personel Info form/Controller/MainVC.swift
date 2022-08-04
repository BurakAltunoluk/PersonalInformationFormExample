//
//  ViewController.swift
//  Personel Info form
//
//  Created by Burak Altunoluk on 02/08/2022.
//

import UIKit

class MainVC: UIViewController {
    
    var rowNumber = 1
    
    @IBOutlet var contactCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactCollectionView.reloadData()
//        testIt()
//        testIt1()
        print(contacts.contactsArray)
        
        
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInfoPage" {
            let destination = segue.destination as! ContactInfoVC
            destination.rowNumber = rowNumber
        }
    }

    func testIt() {
        contacts.addNewContact(newName: "Sami", newSurname: "Sari", newBirthday: "1964", newHaveLandline: false, newLandlineNo: 0, newPhoneNumber: 0, newPostcode: "303033030", newAdresseInfo: "Hakkari", newProfession: "Kofteci", newHaveCitizinship: false, newCitizinshipNo: 0, newPasportNo: 23232323, newHaveDriverlicance: true, newDriverLicanceNo: 737347734)
    }
    
    func testIt1() {
        contacts.addNewContact(newName: "Hasan", newSurname: "Sari1", newBirthday: "19641", newHaveLandline: false, newLandlineNo: 0, newPhoneNumber: 07899890989, newPostcode: "3030330301", newAdresseInfo: "Hakkari1", newProfession: "Kofteci1", newHaveCitizinship: true, newCitizinshipNo: 89898989, newPasportNo: 0, newHaveDriverlicance: true, newDriverLicanceNo: 737347734)
    }
    
    
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.contactsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! ContactInfoListCollectionViewCell
       // Cell.contactFolderImage.image = UIImage(named: "folderImage")
        Cell.contactInfoLabel.text = contacts.contactsArray[indexPath.row].name
        return Cell
    }
    
    
    
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 188, height: 188)
    }
    
}

extension MainVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     rowNumber = indexPath.row
       // print(rowNumber)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.performSegue(withIdentifier: "toInfoPage", sender: nil)
        }
    }
    
}
