//
//  AllMoviesTVC.swift
//  MovieNest
//
//  Created by Awais Akram on 21/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import UIKit
import SDWebImage

class AllMoviesTVC: UITableViewController {

    // MARK: - Variables
    
    let placeholder_image:UIImage = UIImage(named: "placeholder_movie.png")!
    
    var genreID:String=""
    var genreTitle:String=""
    
    var selectedMovieTitle:String = ""
    var selectedImagePath:String = ""
    var selectedRating:String = ""
    var selectedAdult:Bool = false
    var selectedOverview:String = ""
    var selectedReleaseDate:String = ""
    var selectedPopularity:String = ""
    var selectedVoteCount:String = ""
    
    var moviesData:MovieResponse!
    var pageNumber = 1
    // MARK: - Outlets
    
    
    // MARK: - View Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting tableview background color
        self.tableView.backgroundColor = Colors.dark_gray_color
        self.tableView.separatorStyle = .none // hide tableview cells seperator line
        self.title = genreTitle
        
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
                self.tableView.separatorStyle = .singleLine // show tableview cells seperator line
                self.tableView.reloadData()
            }
            else {
                self.sclErrorAlert(message: "An unknown error occurred!", titleMsg: "Request failed")
            }
        }
        
    }
    
    func getMoreData(completionHandler: @escaping (Bool) -> ()) {
        APIManager.getMoviesList(page: pageNumber, genreID: genreID) { (responseData, error) in
            self.stopLoader()
            if error == nil {
                let newData = MovieResponse(fromDictionary: responseData as! [String : Any])
                self.pageNumber = newData.page
                self.moviesData.page = self.pageNumber
                self.moviesData.results += newData.results
                completionHandler(true)
                
            }
            else {
                completionHandler(false)
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
        let cell:AllMoviesTCell = tableView.dequeueReusableCell(withIdentifier: "\(Constants.cellIdentifier)", for: indexPath) as! AllMoviesTCell
        
        // Configure the cell...
        
        cell.lblTitle.text = self.moviesData.results[indexPath.row].originalTitle
        cell.lblRating.text = "\(self.moviesData.results[indexPath.row].voteAverage ?? 0.0)"
        cell.lblOverview.text = self.moviesData.results[indexPath.row].overview
        
        if let imagePath = self.moviesData.results[indexPath.row].posterPath {
            let movieImagePath = Constants.imageURL + imagePath
            cell.imgView.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
            cell.imgView.sd_setImage(with: URL(string: movieImagePath), placeholderImage: self.placeholder_image)
        }
        else {
            cell.imgView.image = placeholder_image
        }
        
        return cell
    }
    
    // MARK: - Table view delegates
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedMovieTitle = self.moviesData.results[indexPath.row].originalTitle
        selectedImagePath = self.moviesData.results[indexPath.row].backdropPath ?? "nil"
        selectedRating = "\(self.moviesData.results[indexPath.row].voteAverage!)"
        selectedAdult = self.moviesData.results[indexPath.row].adult
        selectedOverview = self.moviesData.results[indexPath.row].overview
        selectedReleaseDate = self.moviesData.results[indexPath.row].releaseDate
        selectedPopularity = "\(self.moviesData.results[indexPath.row].popularity!)"
        selectedVoteCount = "\(self.moviesData.results[indexPath.row].voteCount!)"
        
        self.performSegue(withIdentifier: "segueNext", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.row == moviesData.results.count - 1 {
            if pageNumber < moviesData.totalPages {
                self.pageNumber += 1
                let spinner = UIActivityIndicatorView(style: .whiteLarge)
                spinner.startAnimating()
                spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
                
                self.tableView.tableFooterView = spinner
                self.tableView.tableFooterView?.isHidden = false
                
                // Little delay to show activity indicator
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.getMoreData { (updateStatus) in
                        spinner.stopAnimating()
                        self.tableView.tableFooterView = nil
                        self.tableView.tableFooterView?.isHidden = true
                        self.tableView.reloadData()
                    }
                }
            }
        }
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
