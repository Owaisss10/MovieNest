//
//  Extensions.swift
//  MovieNest
//
//  Created by Awais Akram on 21/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import Foundation
import RappleProgressHUD
import SCLAlertView

extension UIViewController {
    
    // MARK: - Functions for showing/hiding loaders(Activity Indicators)
    
    func startLoader() {
        RappleActivityIndicatorView.startAnimating(attributes: RappleModernAttributes)
    }
    
    func stopLoader() {
        RappleActivityIndicatorView.stopAnimation()
    }
    
    // MARK: - Function for displaying error alerts
    func sclErrorAlert(message: String, titleMsg: String) {
        _ = SCLAlertView().showError(titleMsg, subTitle:message, closeButtonTitle:"Okay")
    }
    
    func sclSuccessAlert(message: String, titleMsg: String) {
        _ = SCLAlertView().showSuccess(titleMsg, subTitle:message, closeButtonTitle:"Okay")
    }
    
}


