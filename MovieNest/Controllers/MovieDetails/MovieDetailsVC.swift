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
    var adult:Bool?
    var overview:String = ""
    var releaseDate:String = ""
    var popularity:String = ""
    var vote_count:String = ""
    
    let placeholder_image:UIImage = UIImage(named: "placeholder_movie.png")!
    
    // MARK: - Outlets
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    @IBOutlet weak var lblAdult: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var lblVoteCount: UILabel!
    
    
    // MARK: - View Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.updateUI()
    }
    
    // MARK: - Button Actions
    
    // MARK: - Functions
    
    func updateUI() {
        
        DispatchQueue.main.async {
            
            self.title = self.movieTitle // display movie name on nav bar
            
            if self.imagePath != "nil" {
                let movieImagePath = "\(Constants.imageURL)\(self.imagePath)"
                
                // Set Movie Image
                self.imgView.sd_imageIndicator = SDWebImageActivityIndicator.large
                self.imgView.sd_setImage(with: URL(string: movieImagePath), placeholderImage: self.placeholder_image)
            }
            else {
                self.imgView.image = self.placeholder_image
            }
            
            
    
            self.lblMovieTitle.text = self.movieTitle // Display Movie Title
            self.lblRating.text = self.rating + "/10" // Display Movie Rating
            
            self.lblOverview.text = self.overview // Display Movie overview content
            
            // Display Movie release date, Popularity & Vote Count
            self.lblReleaseDate.text = "Released on: \(self.releaseDate)"
            self.lblPopularity.text = "Popularity: \(self.popularity)"
            self.lblVoteCount.text = "Vote Count: \(self.vote_count)"
        }
    }
    
    
    // MARK: - Navigation

}
