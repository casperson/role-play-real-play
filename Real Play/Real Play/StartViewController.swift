//
//  StartViewController.swift
//  Real Play
//
//  Created by Braden Casperson on 7/20/17.
//  Copyright © 2017 Braden Casperson. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginButton.layer.borderColor = UIColor.white.cgColor
        beginButton.layer.cornerRadius = 4
        beginButton.layer.borderWidth = 2
    }
    
    @IBAction func beginGame(_ sender: Any) {
        self.performSegue(withIdentifier: "GameplayViewControllerSegue", sender: self)
    }
    
}
