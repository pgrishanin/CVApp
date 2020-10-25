//
//  WelcomeViewController.swift
//  CVApp
//
//  Created by Pavel Grishanin on 25.10.2020.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = user.name
    }
    
    func set(user: User) {
        self.user = user
    }

}
