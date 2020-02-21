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
    
    var genreData:GenreResponse!
    
    // MARK: - Outlets
    
    
    // MARK: - View Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _  = self.loadData()
    }
    
    // MARK: - Button Actions
    
    // MARK: - Functions
    
    func loadData() {
        self.startLoader()
        APIManager.fetchAllGenreIDS { (responseData, error) in
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
  
}
