//
//  CategoryCollectionViewCell.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-30.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblCategoryName: UILabel!
    class var reuseIdentifier: String {
        return "CategoryCollectionCellReusable"
    }
    
    class var nibName: String {
        return "CategoryCollectionViewCell"
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        
        }
    func confixXIB(category: Category) {
        lblCategoryName.text = category.categoryName
    }
    

}
