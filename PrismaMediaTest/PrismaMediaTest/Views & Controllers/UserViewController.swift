//
//  UserViewController.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userManager.getUser(done: { [unowned self] in
            self.refresh()
        })
    }
    
    func refresh() {
        nameLabel.text = userManager.user.fullName
        emailLabel.text = userManager.user.email
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UserModificationViewController {
            destination.loadView()
            destination.firstNameTextField.text = userManager.user.firstName
            destination.lastNameTextField.text = userManager.user.lastName
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        if let source = segue.source as? UserModificationViewController {
            guard let firstName = source.firstNameTextField.text, let lastName = source.lastNameTextField.text else {
                return
            }
            userManager.updateUser(firstName: firstName, lastName: lastName)
            refresh()
        }
    }
}
