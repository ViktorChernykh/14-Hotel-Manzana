//
//  RoomTableViewController.swift
//  Hotel Manzana
//
//  Created by Viktor on 24/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import UIKit

class RoomTableViewController: UITableViewController {
    
    // MARK: - Stored Properties
    let rooms = RoomType.all
    var selectedRoomType: RoomType?

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath) as! RoomCell
        let row = indexPath.row
        cell.roomNameLabel.text = "\(rooms[row].name)"
        cell.roomPriceLabel.text = "\(rooms[row].price) $"
        if let selectedRoom = selectedRoomType, selectedRoom.id == row {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  row = indexPath.row
        selectedRoomType = rooms[row]
        tableView.reloadData()
    }

}
