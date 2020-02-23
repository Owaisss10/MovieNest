//
//  WelcomeVC.swift
//  MovieNest
//
//  Created by Awais Akram on 21/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Variables
    
    // MARK: - Outlets
    
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var lblTapAnywhere: UILabel!
    
    // MARK: - View Loads

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = self.updateUI()
    }
    
    // MARK: - Button Actions
    
    
    // MARK: - Functions
    
    func updateUI() {
        
        // Fade In and Out to animate the label
        self.fadeViewInThenOut(view: self.lblTapAnywhere)
        
        // Tap Gesture recognizer initilization and setting target function
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapRecognizer)
        tapRecognizer.delegate = self
    }
    
    @objc func tapped(gestureRecognizer: UITapGestureRecognizer) {
        // navigate to next screen
        let transition = CATransition()
        transition.duration = 0.8
        transition.type = CATransitionType.fade
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        let homeNCVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeNCVC")
        
        self.present(homeNCVC!, animated: false, completion: nil)
    }
    
    // MARK: - Navigation


}
