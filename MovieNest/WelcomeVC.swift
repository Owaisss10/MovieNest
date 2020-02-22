//
//  WelcomeVC.swift
//  MovieNest
//
//  Created by Awais Akram on 21/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    // MARK: - Variables
    
    
    // MARK: - Outlets
    
    
    
    @IBOutlet weak var btnStart: UIButton!
    
    
    
    // MARK: - View Loads

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = self.updateUI()
    }
    
    // MARK: - Button Actions
    
    
    // MARK: - Functions
    
    func updateUI() {
        self.btnStart.layer.cornerRadius = 10
        self.btnStart.clipsToBounds = true
    }
    
    // MARK: - Navigation


}
