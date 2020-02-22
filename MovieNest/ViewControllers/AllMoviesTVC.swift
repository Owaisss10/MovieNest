//
//  AllMoviesTVC.swift
//  MovieNest
//
//  Created by Awais Akram on 21/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import UIKit

class AllMoviesTVC: UITableViewController {

    // MARK: - Variables
    
    var genreID:String=""
    
    var selectedMovieTitle:String = ""
    var selectedImagePath:String = ""
    var selectedRating:String = ""
    var selectedAdult:Bool = false
    var selectedOverview:String = ""
    var selectedReleaseDate:String = ""
    
    var moviesData:MovieResponse!
    
    // MARK: - Outlets
    
    
    // MARK: - View Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = Colors.dark_gray_color
        
        _  = self.loadData(genreID: self.genreID)
    }
    
    // MARK: - Button Actions
    
    // MARK: - Functions
    
    func loadData(genreID: String) {
        self.startLoader()
        APIManager.getMoviesList(genreID: genreID) { (responseData, error) in
            self.stopLoader()
            if error == nil {
                self.moviesData = MovieResponse(fromDictionary: responseData as! [String : Any])
                self.tableView.reloadData()
            }
            else {
                self.sclErrorAlert(message: "An unknown error occurred!", titleMsg: "Request failed")
            }
        }
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.moviesData == nil {
            return 0
        }
        else {
            return self.moviesData.results.count
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:AllMoviesTCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllMoviesTCell
        
        // Configure the cell...
        
        cell.lblTitle.text = self.moviesData.results[indexPath.row].originalTitle
        cell.lblRating.text = "\(self.moviesData.results[indexPath.row].voteAverage ?? 0.0)"
        
        return cell
    }
    
    // MARK: - Table view delegates
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedMovieTitle = self.moviesData.results[indexPath.row].originalTitle
        selectedImagePath = self.moviesData.results[indexPath.row].backdropPath
        selectedRating = "\(self.moviesData.results[indexPath.row].voteAverage!)"
        selectedAdult = self.moviesData.results[indexPath.row].adult
        selectedOverview = self.moviesData.results[indexPath.row].overview
        selectedReleaseDate = self.moviesData.results[indexPath.row].releaseDate
        
        self.performSegue(withIdentifier: "segueNext", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
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
            
        }
    }

}
