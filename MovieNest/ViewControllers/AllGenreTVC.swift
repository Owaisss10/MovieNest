//
//  AllGenreTVC.swift
//  MovieNest
//
//  Created by Awais Akram on 21/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import UIKit

class AllGenreTVC: UITableViewController {

    // MARK: - Variables
    
    var selectedGenreID:String = ""
    var selectedGenreTitle:String = ""
    var genreData:GenreResponse!
    
    // MARK: - Outlets
    
    
    // MARK: - View Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = Colors.dark_gray_color
        
        _  = self.loadData()
    }
    
    // MARK: - Button Actions
    
    // MARK: - Functions
    
    func loadData() {
        self.startLoader()
        APIManager.getAllGenreIDS { (responseData, error) in
            self.stopLoader()
            if error == nil {
                self.genreData = GenreResponse(fromDictionary: responseData as! [String : Any])
                self.tableView.reloadData()
            }
            else {
                self.sclErrorAlert(message: "An unknown error occurred!", titleMsg: "Request failed")
            }
        }
        
    }
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.genreData == nil {
            return 0
        }
        else {
            return self.genreData.genres.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:AllGenreTCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllGenreTCell

        // Configure the cell...
        
        cell.lblTitle.text = self.genreData.genres[indexPath.row].name

        return cell
    }
    
    // MARK: - Table view delegates

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let id = self.genreData.genres[indexPath.row].id
        self.selectedGenreID = "\(id!)"
        self.selectedGenreTitle = self.genreData.genres[indexPath.row].name
        
        self.performSegue(withIdentifier: "segueNext", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueNext" {
            let vc = segue.destination as? AllMoviesTVC
            vc?.genreID = "\(self.selectedGenreID)"
            vc?.genreTitle = self.selectedGenreTitle
        }
    }
  
}
