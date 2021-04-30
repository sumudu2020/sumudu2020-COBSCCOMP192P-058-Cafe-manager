//
//  model.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-30.
//

import Foundation

struct Category {
    
    var categoryName: String
    var categoryID: String
}
struct FoodItem{
    
    var foodItemID: String
    var foodName: String
    var foodDescription: String
    var foodPrice: Double
    var discount: Int
    var foodImgRes: String
    var foodCategory: String
    var isActive: Bool
}

struct Order {
    var orderID: String
    var cust_email: String
    var cust_name: String
    var date: Double
    var status_code: Int
    var orderItems: [OrderItem] = []
}

struct OrderItem {
    var item_name: String
    var price: Double
}
