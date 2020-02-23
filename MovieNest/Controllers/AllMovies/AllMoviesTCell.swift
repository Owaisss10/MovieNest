//
//  AllMoviesTCell.swift
//  MovieNest
//
//  Created by Awais Akram on 21/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import UIKit

class AllMoviesTCell: UITableViewCell {

    // MARK: - Variables
    
    // MARK: - Outlets Connections
    
    @IBOutlet weak var imgView: UIImageView!
    
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblOverview: UILabel!
    
    @IBOutlet weak var lblRating: UILabel!
    
    // MARK: - Table View Cell Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
