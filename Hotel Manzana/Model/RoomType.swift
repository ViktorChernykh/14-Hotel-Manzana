//
//  RoomType.swift
//  Hotel Manzana
//
//  Created by Viktor on 22/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

struct RoomType {
    var id: Int
    var name: String
    var shortName: String
    var numberOfGuests: Int
    var price: Int
    
    static var all: [RoomType] {
        return [
            RoomType(id: 0, name: "Two Queens", shortName: "2Q", numberOfGuests: 2, price: 179),
            RoomType(id: 1, name: "One King", shortName: "K", numberOfGuests: 3, price: 209),
            RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", numberOfGuests: 4, price: 309),
        ]
    }
}

// MARK: - Equatable
extension RoomType: Equatable {
    static func == (left: RoomType, right: RoomType) -> Bool {
        return left.id == right.id
    }
}
