//
//  ResultValid.swift
//  Hotel Manzana
//
//  Created by Viktor on 01/05/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

struct ResultValid {
    var isValid: Bool
    var message: String
    
    init(isValid: Bool = true, message: String = "") {
        self.isValid = isValid
        self.message = message
    }
}
