//
//  AddRegistrationTableViewController.swift
//  Hotel Manzana
//
//  Created by Viktor on 24/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    // MARK: - IB Outlet
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet weak var wifiLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    // MARK: - Stored Properties
    var activeField: UITextField?
    var guest: Guest?
    var roomType: RoomType?
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    // MARK: - Computed Properties
    var isCheckInDatePickerShown = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }

    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        
        setupUI()
        updateUI()
        updatePrice()
    }
    
    // MARK: - Custom Methods
    func setupDateViews() {
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
    }
    
    func setupUI() {
        setupDateViews()
        updateNumberOfGuests()
    }
    
    func updateDateViews() {
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(60 * 60 * 24)
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = .medium
        checkInDateLabel.text = formatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = formatter.string(from: checkOutDatePicker.date)
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    func updatePrice() {
        let dateCount = checkOutDatePicker.date.timeIntervalSince(checkInDatePicker.date) / (60 * 60 * 24)
        var totalPriceWiFi = 0
        var totalRoomPrice = 0
        if wifiSwitch.isOn {
            totalPriceWiFi = Int(dateCount) * 10
            wifiLabel.text = "Price for WiFi  \(totalPriceWiFi)$"
        } else {
            wifiLabel.text = "Wi-Fi ($10 per day)"
        }
        if let room = roomType {
            totalRoomPrice = Int(dateCount) * room.price
        }

        let totalPrice = totalRoomPrice + totalPriceWiFi
        totalPriceLabel.text = "\(totalPrice)$"
    }
    
    func updateUI() {
        updateDateViews()
    }
    
    // MARK: - IB Actions
    @IBAction func datePickerValueChanged() {
        updateDateViews()
        updatePrice()
    }
    
    @IBAction func saveButtonTapped() {
        let firstName = firstNameField.text ?? ""
        let lastName = lastNameField.text ?? ""
        let email = emailField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let wifi = wifiSwitch.isOn
        let typeOfRoom = roomType?.name ?? ""
        let totalPrice = totalPriceLabel.text ?? "0"
        
        print(#line, #function, "Save Button Tapped")
        print("First Name: ", firstName)
        print("Last Name: ", lastName)
        print("E-mail: ", email)
        print("Check-In:", checkInDate)
        print("Check-Out:", checkOutDate)
        print("Number of Adults:", numberOfAdults)
        print("Number of Children:", numberOfChildren)
        print("Wi-Fi Included:", wifi)
        print("Type of room", typeOfRoom)
        print("Total Price", totalPrice)
        
        let validation = Validation()
        
        let firstNameValid = validation.performValidText(firstName, type: .stringWithFirstLetterCaps)
        let lastNameValid = validation.performValidText(lastName, type: .stringWithFirstLetterCaps)
        let emailValid = validation.performValidText(email, type: .email)
        
        let choceRoomValid = validation.performValidNoNil(roomType, text: "Выберите тип комнаты")

        validation.giveTextFieldColor(firstNameField, with: firstNameValid)
        validation.giveTextFieldColor(lastNameField, with: lastNameValid)
        validation.giveTextFieldColor(emailField, with: emailValid)
        validation.giveLabelColor(roomLabel, with: choceRoomValid)
        
        if firstNameValid.isEmpty &&
            lastNameValid.isEmpty &&
            emailValid.isEmpty &&
            roomType != nil {
            
            guest = Guest(firstName: firstName,
                 lastName: lastName,
                 email: email,
                 checkInDate: checkInDate,
                 checkOutDate: checkOutDate,
                 numberOfAdults: numberOfAdults,
                 numberOfChildren: numberOfChildren,
                 isWifi: wifi,
                 roomType: roomType!,
                 totalPrice: Int(totalPrice) ?? 0
            )
        }
    }
    
    @IBAction func stepperValueChanged() {
        updateNumberOfGuests()
    }
    
    @IBAction func switchWiFiChanged() {
        updatePrice()
    }
}

// MARK: - Table View Data Source
extension AddRegistrationTableViewController /*: UITableViewDataSource */ {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let autoHeight = UITableView.automaticDimension
        
        switch indexPath {

        case checkInDatePickerCellIndexPath:
            return isCheckInDatePickerShown ? autoHeight : 0

        case checkOutDatePickerCellIndexPath:
            return isCheckOutDatePickerShown ? autoHeight : 0

        default:
            return autoHeight
        }
    }
}

// MARK: - Table View Delegate
extension AddRegistrationTableViewController /*: UITableViewDelegate */ {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
            
        case checkInDatePickerCellIndexPath.prevRow:
            isCheckInDatePickerShown.toggle()
            isCheckOutDatePickerShown = isCheckInDatePickerShown ? false : isCheckOutDatePickerShown
            
        case checkOutDatePickerCellIndexPath.prevRow:
            isCheckOutDatePickerShown.toggle()
            isCheckInDatePickerShown = isCheckOutDatePickerShown ? false : isCheckInDatePickerShown
            
        default:
            isCheckInDatePickerShown = false
            isCheckOutDatePickerShown = false
            //return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

// MARK: - Navigation
extension AddRegistrationTableViewController {
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "SaveRoomUnwind" else { return }
        guard let controller = segue.source as? RoomTableViewController else { return }
        if controller.selectedRoomType != nil {
            roomType = controller.selectedRoomType
            roomLabel.text = roomType!.name
            updatePrice()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "RoomsChoiсeSegue" else { return }
        guard let controller = segue.destination as? RoomTableViewController else { return }

        controller.selectedRoomType = roomType
    }
}

extension AddRegistrationTableViewController {

    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        guard let text = textField.text else { return false }
//
//        switch textField {
//        case firstNameField:
//            let isValid = isTextValid(text)
//            changeBorderColor(firstNameField, isValid)
//
//        case lastNameField:
//            let isValid = isTextValid(text)
//            changeBorderColor(lastNameField, isValid)
//
//        case emailField:
//            let isValid = isEmailValid(text)
//                changeBorderColor(emailField, isValid)
//
//        default:
//            break
//        }
//        return true
//    }
    

}
