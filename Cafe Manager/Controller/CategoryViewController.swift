//
//  CategoryViewController.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-27.
//

import UIKit
import Firebase
import Loaf


class CategoryViewController: UIViewController {
    let databasereference = Database.database().reference()
    
    
    var categoryList: [Category] = []
    

    @IBOutlet weak var txtcategory: UITextField!
    
    @IBOutlet weak var tblCatagory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblCatagory.register(UINib(nibName: CategoryInfoTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CategoryInfoTableViewCell.reuseIdentifier)
         refreshCategories()
       
    }
    

    @IBAction func onAddCategoryPressed(_ sender: UIButton) {
        
        if let name = txtcategory.text{
            addCategories(name: name)
        } else{
            Loaf ("enter category name", state: .success, sender: self).show()
        }
    }
    
    }

extension CategoryViewController {
    func addCategories(name: String){
        databasereference
            .child("Categories")
            .childByAutoId()
            .child("name")
            .setValue(name){
                error, ref in
                if let error = error {
                    Loaf(error.localizedDescription, state: .error,sender: self).show()
                } else{
                    Loaf ("Category created", state: .success, sender: self).show()
                    self.refreshCategories()
                }
            }
        
        
        
        }
    func refreshCategories(){
        self.categoryList.removeAll()
        
        databasereference
            .child ("Categories")
            .observeSingleEvent(of: .value, with: {
                snapshot in
                if snapshot.hasChildren(){
                    
                    guard let data = snapshot.value as? [String:Any]else{
                        return
                    }
                    for category in data{
                        if let categoryInfo = category.value as? [String:String]{
                            self.categoryList.append(Category(categoryName:categoryInfo["name"]!, categoryID: category.key))
                            
                        }
                        
                    }
                    self.tblCatagory.reloadData()
                }
            })
    }
    func removeCategory(category : Category) {
        
        databasereference
            .child ("Categories")
            .child(category.categoryID)
            .removeValue(){
                error, databaseReference in
                if error != nil {
                    Loaf("Could not remove category", state: .error, sender: self).show()
                } else {
                    Loaf("Category Removed", state: .success, sender: self).show()
                    self.refreshCategories()
                }
                
            }
        }
   
}
extension  CategoryViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblCatagory.dequeueReusableCell(withIdentifier: CategoryInfoTableViewCell.reuseIdentifier, for: indexPath) as! CategoryInfoTableViewCell
        cell.selectionStyle = .none
        cell.configtablecell(category: self.categoryList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.removeCategory(category:categoryList[indexPath.row])
            refreshCategories()
        }
    }
    
}
    

