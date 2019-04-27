//
//  GuestTableViewController.swift
//  Hotel Manzana
//
//  Created by Viktor on 27/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import UIKit

class GuestTableViewController: UITableViewController {
    // MARK: - Stored Properties
    var guests = [Guest]()

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guests.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GuestCell", for: indexPath)

        cell.textLabel?.text = guests[indexPath.row].lastName + " " + guests[indexPath.row].firstName
        return cell
    }

    // MARK: - Navigation
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "SaveGuestUnwind" else { return }
        guard let controller = segue.source as? AddRegistrationTableViewController else { return }
        guard let guest = controller.guest else { return }
        guests.append(guest)
        tableView.reloadData()
    }

}
