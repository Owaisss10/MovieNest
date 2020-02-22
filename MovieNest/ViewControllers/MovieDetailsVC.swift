//
//  MovieDetailsVC.swift
//  MovieNest
//
//  Created by Awais Akram on 22/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsVC: UIViewController {

    // MARK: - Variables
    
    var movieTitle:String = ""
    var imagePath:String = ""
    var rating:String = ""
    var adult:Bool = false
    var overview:String = ""
    var releaseDate:String = ""
    
    let placeholder_image:UIImage = UIImage(named: "placeholder.png")!
    
    // MARK: - Outlets
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    @IBOutlet weak var lblOverview: UILabel!
    
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    // MARK: - View Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.updateUI()
    }
    
    // MARK: - Button Actions
    
    // MARK: - Functions
    
    func updateUI() {
        
        DispatchQueue.main.async {
            let movieImagePath = "\(Constants.imageURL)\(self.imagePath)"
            
            self.imgView.sd_setImage(with: URL(string: movieImagePath), placeholderImage: self.placeholder_image)
            
            self.lblMovieTitle.text = self.movieTitle
            self.lblRating.text = self.rating
            self.lblOverview.text = self.overview
            self.lblReleaseDate.text = "Released on: \(self.releaseDate)"
        }
    }
    
    
    // MARK: - Navigation

}
