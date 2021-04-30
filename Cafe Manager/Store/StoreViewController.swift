//
//  StoreViewController.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-30.
//

import UIKit

class StoreViewController: UIViewController {

    var tabBarContainerStore : UITabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tabBarSegue" {
            self.tabBarContainerStore = segue.destination as? UITabBarController
            
    }
        
            
        self.tabBarContainerStore?.tabBar.isHidden = true
    }

    
    @IBAction func onsequeIndexchange(_ sender: UISegmentedControl) {
        
        print(tabBarContainerStore)
        
        tabBarContainerStore?.selectedIndex = sender.selectedSegmentIndex
    }
   
    }
    


