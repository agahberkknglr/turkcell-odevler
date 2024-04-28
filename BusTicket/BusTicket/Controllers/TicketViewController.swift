//
//  TicketViewController.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 28.04.2024.
//

import UIKit
import CoreData

class TicketViewController: UIViewController {

    //MARK: IBOutles
    @IBOutlet weak var ticketImage: UIImageView!
    @IBOutlet weak var ticketDepartureLabel: UILabel!
    @IBOutlet weak var ticketArrivalLabel: UILabel!
    @IBOutlet weak var ticketTimeLabel: UILabel!
    @IBOutlet weak var ticketPassengerNameLabel: UILabel!
    @IBOutlet weak var ticketSeatLabel: UILabel!
    @IBOutlet weak var ticketPriceLabel: UILabel!
    @IBOutlet weak var ticketIdLabel: UILabel!
    
    //MARK: Variables
    var ticketInfoModel: BusInfoModel?
    var seats = "", name = "", surname = "", id = ""
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupImage()
    }
    
    //MARK: Functions
    private func setupLabels(){
        ticketDepartureLabel.text = ticketInfoModel?.busDeparture
        ticketArrivalLabel.text = ticketInfoModel?.busArrival
        ticketTimeLabel.text = ticketInfoModel!.busTime + " " + ticketInfoModel!.busDate
        ticketPassengerNameLabel.text = "\(name) \(surname)"
        ticketSeatLabel.text = "Seat Numbers: \(seats)"
        ticketPriceLabel.text = "\(ticketInfoModel?.busPrice ?? "")₺"
        ticketIdLabel.text = "ID: \(id)"
    }
    
    private func setupImage(){
        ticketImage.image = ticketInfoModel?.companyImage
    }
}
