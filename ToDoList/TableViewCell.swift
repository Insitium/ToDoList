//
//  AppDelegate.swift
//  To-Do List App
//
/* Created and Developed by
 Manmeen Kaur - 301259638
 Neha Patel - 301280513
 Sarthak Vashistha - 301245284
 
 Date Created: 11/27/2022
 To-Do List App - Created To Do List App - Data Persistence
 Version: 1.2.0
 */
//

import UIKit
class TableViewCell: UITableViewCell{

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    @IBOutlet weak var buttonEdit: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
