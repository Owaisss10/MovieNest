//
//  Constants.swift
//  MovieNest
//
//  Created by Awais Akram on 21/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import Foundation
import UIKit

let userDefaults = UserDefaults.standard

struct Constants {
    
    static let appThemeColor:UIColor = Colors.yellow_color
    
    static let API_KEY = "8ce87288c07809c7597ee9e0e9bb0a7d"
    static let LANGUAGE = "&language=en-US"
    
    static let discover = "discover/movie?"
    
    static let serverURL = "https://api.themoviedb.org/3/"
    static let allGenres = "genre/movie/list?"
    
    static let imageURL = "https://image.tmdb.org/t/p/original/"
    
}


struct Colors {
    static var dark_gray_color:UIColor = UIColor(red: 78.0/255.0, green: 91.0/255.0, blue: 96.0/255.0, alpha: 1)
    static var yellow_color:UIColor = UIColor(red: 249.0/255.0, green: 188.0/255.0, blue: 80.0/255.0, alpha: 1)
}
