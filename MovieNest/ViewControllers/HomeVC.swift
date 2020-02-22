//
//  HomeVC.swift
//  MovieNest
//
//  Created by Awais Akram on 22/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import UIKit
import SDWebImage
class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - Variables
    
    var moviesData:PopularMoviesResponse!
    
    let placeholder_image:UIImage = UIImage(named: "placeholder.png")!
    
    var selectedMovieTitle:String = ""
    var selectedImagePath:String = ""
    var selectedRating:String = ""
    var selectedAdult:Bool = false
    var selectedOverview:String = ""
    var selectedReleaseDate:String = ""
    var selectedPopularity:String = ""
    var selectedVoteCount:String = ""
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var btnPreference: UIButton!
    
    // MARK: - View Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        _ = self.updateUI()
        
        _ = self.loadData()
    }
    
    // MARK: - Button Actions
    
    
    // MARK: - Functions
    
    func updateUI() {
        self.btnPreference.layer.cornerRadius = 10
        self.btnPreference.clipsToBounds = true
    }
    
    func loadData() {
        self.startLoader()
        APIManager.getPopularMoviesList { (responseData, error) in
            self.stopLoader()
            if error == nil {
                self.moviesData = PopularMoviesResponse(fromDictionary: responseData as! [String : Any])
                self.collectionView.reloadData()
            }
            else {
                self.sclErrorAlert(message: "An unknown error occurred!", titleMsg: "Request failed")
            }
        }
    }
    
    // MARK: - Colection view Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.moviesData == nil {
            return 0
        }
        else {
            return self.moviesData.results.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:HomeCCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCCell
        
        let imagePath = self.moviesData.results[indexPath.row].posterPath
        
        let movieImagePath = Constants.imageURL + imagePath!
        cell.imgView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        cell.imgView.sd_setImage(with: URL(string: movieImagePath), placeholderImage: self.placeholder_image)
        
        return cell
    }
    
    // MARK: - Colection view delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedMovieTitle = self.moviesData.results[indexPath.row].originalTitle
        selectedImagePath = self.moviesData.results[indexPath.row].backdropPath
        selectedRating = "\(self.moviesData.results[indexPath.row].voteAverage!)"
        selectedAdult = self.moviesData.results[indexPath.row].adult
        selectedOverview = self.moviesData.results[indexPath.row].overview
        selectedReleaseDate = self.moviesData.results[indexPath.row].releaseDate
        selectedPopularity = "\(self.moviesData.results[indexPath.row].popularity!)"
        selectedVoteCount = "\(self.moviesData.results[indexPath.row].voteCount!)"
        
        self.performSegue(withIdentifier: "segueNext", sender: self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueNext" {
            let vc = segue.destination as? MovieDetailsVC
            
            vc?.movieTitle = selectedMovieTitle
            vc?.imagePath = selectedImagePath
            vc?.rating = selectedRating
            vc?.adult = selectedAdult
            vc?.overview = selectedOverview
            vc?.releaseDate = selectedReleaseDate
            vc?.popularity = selectedPopularity
            vc?.vote_count = selectedVoteCount
        }
    }

}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = UIScreen.main.bounds.width/4
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight+20)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
