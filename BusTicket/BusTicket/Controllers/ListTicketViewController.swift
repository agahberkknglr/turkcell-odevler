//
//  ListTicketViewController.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 27.04.2024.
//

import UIKit

class ListTicketViewController: UIViewController {

    @IBOutlet weak var departCityLabel: UILabel!
    @IBOutlet weak var arriveCityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var departCity = "", arriveCity = "", dateText = ""
    var emptyView: EmptyView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        setupEmptyView()
        
        tableView.register(UINib(nibName: "TicketTableViewCell", bundle: nil), forCellReuseIdentifier: "ticketCell")
    }
    
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
    
    
    
}

extension ListTicketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketTableViewCell
        
        return cell
    }
    
//    func toggleEmptyViewVisibility() {
//        if dataSource.isEmpty {
//            emptyView?.isHidden = false
//        } else {
//            emptyView?.isHidden = true
//        }
//    }
    
    
}
