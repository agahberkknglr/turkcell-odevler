//
//  DestinationModel.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 27.04.2024.
//

import Foundation

struct DestinationModel {
    var departureCity: String
    var arrivalCity: String
    
    init(departureCity: String = "", arrivalCity: String = "") {
        self.departureCity = departureCity
        self.arrivalCity = arrivalCity
    }
}
