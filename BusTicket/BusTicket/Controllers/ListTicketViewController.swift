//
//  ListTicketViewController.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 27.04.2024.
//

import UIKit

class ListTicketViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var departCityLabel: UILabel!
    @IBOutlet weak var arriveCityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var departCity = "", arriveCity = "", dateText = ""
    var emptyView: EmptyView?
    var destinationModel = DestinationModel()
    var busInfo = [BusInfoModel]()
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        setupEmptyView()
        
        tableView.register(UINib(nibName: "TicketTableViewCell", bundle: nil), forCellReuseIdentifier: "ticketCell")
        navigationItem.hidesBackButton = true
        setBusDeparture()
        setBusInfo()
    }
    
    //MARK: Functions
    func setLabels() {
        departCityLabel.text = departCity
        arriveCityLabel.text = arriveCity
        dateLabel.text = dateText
    }
    
    func setupEmptyView() {
        emptyView = EmptyView(frame: tableView.bounds)
        tableView.backgroundView = emptyView
        emptyView?.isHidden = true
    }
    
    func setBusDeparture() {
        destinationModel.departureCity = departCity
        destinationModel.arrivalCity = arriveCity
    }
    
    func setBusInfo() {
        busInfo = [
            BusInfoModel(companyName: "Flix Bus", companyImage: UIImage(named: "flixbus")!, busPrice: "500", busDeparture: destinationModel.departureCity, busArrival: destinationModel.arrivalCity, busTime: "12:00", busDate: dateText),
            BusInfoModel(companyName: "Pamukkale Turizm", companyImage: UIImage(named: "pamukkale")!, busPrice: "350", busDeparture: destinationModel.departureCity, busArrival: destinationModel.arrivalCity, busTime: "13:00", busDate: dateText),
            BusInfoModel(companyName: "Flix Bus", companyImage: UIImage(named: "flixbus")!, busPrice: "500", busDeparture: destinationModel.departureCity, busArrival: destinationModel.arrivalCity, busTime: "14:00", busDate: dateText),
            BusInfoModel(companyName: "Pamukkale Turizm", companyImage: UIImage(named: "pamukkale")!, busPrice: "350", busDeparture: destinationModel.departureCity, busArrival: destinationModel.arrivalCity, busTime: "15:00", busDate: dateText),
            BusInfoModel(companyName: "Manisa Seyahat", companyImage: UIImage(named: "manisa-seyahat")!, busPrice: "400", busDeparture: destinationModel.departureCity, busArrival: destinationModel.arrivalCity, busTime: "16:00", busDate: dateText),
            BusInfoModel(companyName: "Flix Bus", companyImage: UIImage(named: "flixbus")!, busPrice: "400", busDeparture: destinationModel.departureCity, busArrival: destinationModel.arrivalCity, busTime: "17:00", busDate: dateText),
            BusInfoModel(companyName: "Pamukkale Turizm", companyImage: UIImage(named: "pamukkale")!, busPrice: "200", busDeparture: destinationModel.departureCity, busArrival: destinationModel.arrivalCity, busTime: "18:00", busDate: dateText),
            BusInfoModel(companyName: "Pamukkale Turizm", companyImage: UIImage(named: "pamukkale")!, busPrice: "200", busDeparture: destinationModel.departureCity, busArrival: destinationModel.arrivalCity, busTime: "19:00", busDate: dateText)
        ]
        print(busInfo)
    }
    
    
    
}

//MARK: Extensions
extension ListTicketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketTableViewCell
        cell.setupTicket(busInfo[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBusInfo = busInfo[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TicketSeatViewController") as! TicketSeatViewController
        vc.selectedBusInfo = selectedBusInfo
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toggleEmptyViewVisibility() {
        if busInfo.isEmpty {
            emptyView?.isHidden = false
        } else {
            emptyView?.isHidden = true
        }
    }
    
    
    
    
}
