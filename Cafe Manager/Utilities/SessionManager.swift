//
//  SessionManager.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-27.
//

import Foundation

class SessionManager{
    
    func getLoggedStatus() -> Bool{
      return UserDefaults.standard.bool(forKey: "Logged_In")
        
        }
    func SaveManagerLogin (user : manager){
        UserDefaults.standard.setValue(true, forKey: "Logged_In")
        UserDefaults.standard.setValue(user.managerName, forKey: "MANAGER_NAME")
        UserDefaults.standard.setValue(user.managerEmail, forKey: "MANAGER_EMAIL")
        UserDefaults.standard.setValue(user.managerPhone, forKey: "MANAGER_PHONE")
       
        
    }
    
    func getUserData() -> manager {
      let user = manager(
        
        managerName: UserDefaults.standard.string(forKey: "MANAGER_NAME") ?? "",
        managerEmail: UserDefaults.standard.string(forKey: "MANAGER_EMAIL") ?? "",
        managerPassword: "",
        managerPhone: UserDefaults.standard.string(forKey: "MANAGER_PHONE") ?? "")
        
        return user
    }
    
    func clearManagerLoggedStatus(){
        
        UserDefaults.standard.setValue(false, forKey: "Logged_In")
    }
    
}
