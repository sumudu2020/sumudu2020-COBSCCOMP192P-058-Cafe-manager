//
//  StorePreviewViewController.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-30.
//

import UIKit
import Firebase
import Loaf

class StorePreviewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.tblFoodItem.dequeueReusableCell(withIdentifier: "FoodCell") as UITableViewCell?)!
             
             // set the text from the data model
             cell.textLabel?.text = "Test"
             
             return cell
    }
    
    

    @IBOutlet weak var tblFoodItem: UITableView!{
        didSet {
            tblFoodItem.dataSource = self
            tblFoodItem.delegate = self
        }
    }
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}

