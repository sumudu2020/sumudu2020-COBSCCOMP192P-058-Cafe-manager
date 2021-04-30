//
//  PreviewTableViewCell.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-28.
//

import UIKit
import Kingfisher

class PreviewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgFood: UIImageView!
    
    @IBOutlet weak var lblFoodName: UILabel!
    
    @IBOutlet weak var lblFoodDescription:
        UILabel!
    
    @IBOutlet weak var lblFoodPrice: UILabel!
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var lblDescount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
}
    func setupView(foodItem : FoodItem){
        
        lblFoodName.text = foodItem.foodname
        lblFoodDescription.text = foodItem.foodDescription
        lblFoodPrice.text = "LKR \(foodItem.foodprice)"
        imgFood.image = UIImage(named: foodItem.image)
        imgFood.kf.setImage(with: URL(string: foodItem.image))
        
        if foodItem.foodDiscount > 0 {
            
            viewContainer.isHidden = false
            lblDescount.text = "\(foodItem.foodDiscount)%"
        }
            else{
              
                
                viewContainer.isHidden = true
                lblDescount.text = ""
        }
    }
    
    
}
