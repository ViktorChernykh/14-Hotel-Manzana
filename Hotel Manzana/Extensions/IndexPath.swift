//
//  IndexPath.swift
//  Hotel Manzana
//
//  Created by Viktor on 24/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import UIKit

extension IndexPath {
    var prevRow: IndexPath {
        let row = self.row - 1
        let section = self.section
        
        return IndexPath(row: row, section: section)
    }
}
