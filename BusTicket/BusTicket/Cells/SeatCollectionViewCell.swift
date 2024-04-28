//
//  SeatCollectionViewCell.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 28.04.2024.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SeatCollectionViewCell"

    @IBOutlet weak var seatImageView: UIImageView!
    @IBOutlet weak var seatNumberLabel: UILabel!
    
    func setupSeat(_ model: BusSeatsModel ) {
        seatImageView.image = model.imageSeat
        seatNumberLabel.text = model.seats
    }
    
}
