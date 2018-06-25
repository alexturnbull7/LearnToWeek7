//
//  ContactsViewController.swift
//  LearnToWeek7
//
//  Created by Alex Turnbull on 25/06/2018.
//  Copyright © 2018 Alex Turnbull. All rights reserved.
//

import UIKit
import ContactsUI

class ContactsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getContacts()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getContacts() {
        let contactStore = CNContactStore()
        var contacts = [CNContact]()
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        do {
            try contactStore.enumerateContacts(with: request) { (contact, stop) in
                contacts.append(contact)
            }
            
            print(contacts);
        } catch {
            print(error.localizedDescription)
        }
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
