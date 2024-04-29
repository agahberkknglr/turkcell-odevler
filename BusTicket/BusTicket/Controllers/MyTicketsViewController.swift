//
//  MyTicketsViewController.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 26.04.2024.
//

import UIKit
import CoreData

class MyTicketsViewController: UIViewController {
    
    //MARK: IBOutles
    @IBOutlet weak var myTicketsTableView: UITableView!
    
    //MARK: Variables
    var emptyView: EmptyView?
    var myTickets = [MyTicket]()
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        myTicketsTableView.delegate = self
        myTicketsTableView.dataSource = self
        myTicketsTableView.register(UINib(nibName: "TicketTableViewCell", bundle: nil), forCellReuseIdentifier: "ticketCell")
        
        setupEmptyView()
    }
    override func viewWillAppear(_ animated: Bool) {
        getTickets()
        myTicketsTableView.reloadData()
    }
    
    
    //MARK: Functions
    func setupEmptyView() {
        emptyView = EmptyView(frame: myTicketsTableView.bounds)
        myTicketsTableView.backgroundView = emptyView
        emptyView?.isHidden = true
    }
    
    private func getTickets() {
        myTickets.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Ticket")
        do {
            let results = try context.fetch(fetchRequest)
            
            if !results.isEmpty {
                for result in results as! [NSManagedObject] {
                    if let ticket = createTicket(from: result) {
                        myTickets.append(ticket)
                    } else {
                        print("Uiimage failed to convert from data")
                    }
                }
            }
        } catch {
            print("Datalar cekilemedi...")
        }
        toggleEmptyViewVisibility(myTickets.isEmpty)
    }
    
    private func createTicket(from result: NSManagedObject) -> MyTicket? {
        guard
            let name = result.value(forKey: "name") as? String,
            let surname = result.value(forKey: "surname") as? String,
            let id = result.value(forKey: "id") as? String,
            let departure = result.value(forKey: "departure") as? String,
            let arrival = result.value(forKey: "arrival") as? String,
            let time = result.value(forKey: "time") as? String,
            let seats = result.value(forKey: "seats") as? String,
            let company = result.value(forKey: "company") as? String,
            let companyImage = result.value(forKey: "image") as? Data,
            let price = result.value(forKey: "price") as? String,
            let image = UIImage(data: companyImage)
        else {
            return nil
        }
        return MyTicket(passengerName: name, passengerSurname: surname, passengerId: id, passengerDeparture: departure, passengerArrival: arrival, passengerTime: time, passengerSeats: seats, passengerTicketPrice: price, passengerTicketCompany: company, passengerTicketCompanyImage: image)
    }
    
}

//MARK: Extensions
extension MyTicketsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketTableViewCell
        cell.setupMyTicket(myTickets[indexPath.row])
        return cell
    }
    
    func toggleEmptyViewVisibility(_ isEmpty: Bool) {
        emptyView?.isHidden = !isEmpty
    }
}
