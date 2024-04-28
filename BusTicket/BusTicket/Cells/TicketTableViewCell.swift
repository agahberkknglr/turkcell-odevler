//
//  TicketTableViewCell.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 27.04.2024.
//

import UIKit

class TicketTableViewCell: UITableViewCell {

    @IBOutlet weak var ticketImageView: UIImageView!
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    func setupTicket(_ model: BusInfoModel) {
        ticketImageView.image = model.companyImage
        departureLabel.text = model.busDeparture
        arrivalLabel.text = model.busArrival
        priceLabel.text = model.busPrice + "₺"
        companyLabel.text = model.companyName
        dateLabel.text = model.busTime
    }
    
    func setupMyTicket(_ model:MyTicket) {
        ticketImageView.image = model.passengerTicketCompanyImage
        departureLabel.text = model.passengerDeparture
        arrivalLabel.text = model.passengerArrival
        dateLabel.text = model.passengerTime
        priceLabel.text = model.passengerName + " " + model.passengerSurname
        companyLabel.text = "Seats: " + model.passengerSeats
    }
}
