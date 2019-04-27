//
//  Guest.swift
//  Hotel Manzana
//
//  Created by Viktor on 27/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import Foundation

class Guest {
    // MARK: - Stored Properties
    var firstName: String
    var lastName: String
    var email: String
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    var isWifi: Bool
    var roomType: RoomType
    var totalPrice: Int
    
    // MARK: - Initilaizer
    init(firstName: String,
        lastName: String,
        email: String,
        checkInDate: Date,
        checkOutDate: Date,
        numberOfAdults: Int,
        numberOfChildren: Int,
        isWifi: Bool,
        roomType: RoomType,
        totalPrice: Int) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.checkInDate = checkInDate
        self.checkOutDate = checkOutDate
        self.numberOfAdults = numberOfAdults
        self.numberOfChildren = numberOfChildren
        self.isWifi = isWifi
        self.roomType = roomType
        self.totalPrice = totalPrice
    }
}
