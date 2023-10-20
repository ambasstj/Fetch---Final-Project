//
//  CustomTableViewCell.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/19/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var measurementLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
