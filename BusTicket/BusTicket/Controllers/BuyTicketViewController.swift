//
//  BuyTicketViewController.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 28.04.2024.
//

import UIKit
import CoreData
import Photos

class BuyTicketViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var passengerNameTextField: UITextField!
    @IBOutlet weak var passengerSurnameTextField: UITextField!
    @IBOutlet weak var passengerIdTextField: UITextField!
    @IBOutlet weak var passengerSelectedSeatsLabel: UILabel!
    
    //MARK: Variables
    var selectedPassengerSeats = [Int]()
    var selectedPassengerBusInfo: BusInfoModel?
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
    }
    
    //MARK: Functions
    private func setupLabel() {
        let selectedSeats = selectedPassengerSeats.map { String($0 + 1) }.joined(separator: ", ")
        passengerSelectedSeatsLabel.text = selectedSeats
    }
    
    @IBAction func buyTicketButtonClicked(_ sender: UIButton) {
        let name = passengerNameTextField.text?.isEmpty ?? true ? "No name" : passengerNameTextField.text
        let surname = passengerSurnameTextField.text?.isEmpty ?? true ? "No surname" : passengerSurnameTextField.text
        let id = passengerIdTextField.text?.isEmpty ?? true ? "0" : passengerIdTextField.text
        
        let busCompanyName = selectedPassengerBusInfo?.companyName
        let busCompanyImage = selectedPassengerBusInfo?.companyImage.jpegData(compressionQuality: 0.5)
        let busArrival = selectedPassengerBusInfo?.busArrival
        let busDeparture = selectedPassengerBusInfo?.busDeparture
        let busPrice = selectedPassengerBusInfo?.busPrice
        let busTime = (selectedPassengerBusInfo?.busTime ?? "") + " " + (selectedPassengerBusInfo?.busDate ?? "")
        
        let passangerSeats = passengerSelectedSeatsLabel.text
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Ticket", in: context) else { return }
        
        let ticket = NSManagedObject(entity: entityDescription, insertInto: context)
        
        ticket.setValue(name, forKey: "name")
        ticket.setValue(surname, forKey: "surname")
        ticket.setValue(id, forKey: "id")
        ticket.setValue(busCompanyName, forKey: "company")
        ticket.setValue(busCompanyImage, forKey: "image")
        ticket.setValue(busArrival, forKey: "arrival")
        ticket.setValue(busDeparture, forKey: "departure")
        ticket.setValue(busPrice, forKey: "price")
        ticket.setValue(busTime, forKey: "time")
        ticket.setValue(passangerSeats, forKey: "seats")
        
        do {
            try context.save()
            print("Ticket saved to Core Data")
        } catch let error as NSError {
            print("Couldnt save ticket to Core Data. \(error), \(error.userInfo)")
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TicketViewController") as! TicketViewController
        vc.seats = passangerSeats!
        vc.ticketInfoModel = selectedPassengerBusInfo
        vc.id = id!
        vc.name = name!
        vc.surname = surname!
        navigationController?.pushViewController(vc, animated: true)
    }
}
