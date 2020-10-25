//
//  AboutViewController.swift
//  CVApp
//
//  Created by Pavel Grishanin on 25.10.2020.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImage.layer.cornerRadius = 60
    }

}
