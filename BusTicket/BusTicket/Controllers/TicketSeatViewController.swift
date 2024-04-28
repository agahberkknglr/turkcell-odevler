//
//  TicketSeatViewController.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 27.04.2024.
//

import UIKit

class TicketSeatViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var seatCollectionView: UICollectionView!
    
    //MARK: Variables
    var selectedBusInfo: BusInfoModel?
    var seatsModel = [BusSeatsModel]()
    var selectedSeats = [Int]()
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        seatCollectionView.dataSource = self
        seatCollectionView.delegate = self
        seatCollectionView.register(UINib(nibName: "SeatCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: SeatCollectionViewCell.identifier)
        
        setupCollectionViewLayout()
        setupBusSeatsModel()
    }
    
    //MARK: Functions
    private func setupCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionViewWidth = seatCollectionView.bounds.width
        let itemSpacing: CGFloat = 10
        let numberOfitemsInRow = 4
        let totalSpacing = itemSpacing * CGFloat(numberOfitemsInRow)
        let itemWidth = (collectionViewWidth - totalSpacing) / CGFloat(numberOfitemsInRow)
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumLineSpacing = itemSpacing
        layout.minimumInteritemSpacing = itemSpacing
        
        seatCollectionView.collectionViewLayout = layout
    }
    
    private func setupBusSeatsModel() {
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "1"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "2"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "3"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "4"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "5"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "6"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "7"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "8"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "9"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "10"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "11"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "12"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "13"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "14"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "15"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "16"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "17"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "18"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "19"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "20"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "21"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "22"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "23"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "24"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "25"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "26"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "27"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "28"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "29"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "30"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "31"))
        seatsModel.append(BusSeatsModel(imageSeat: UIImage(named: "seat")!, seats: "32"))
    }
    
    @IBAction func buyTicketClicked(_ sender: UIButton) {
        if !selectedSeats.isEmpty {
            let selectedBusInfo = selectedBusInfo
            let selectedSeatInfo = selectedSeats
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BuyTicketViewController") as! BuyTicketViewController
            vc.selectedPassengerBusInfo = selectedBusInfo
            vc.selectedPassengerSeats = selectedSeatInfo
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "You need to choose at least 1 seat", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}

//MARK: Extensions
extension TicketSeatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seatsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeatCollectionViewCell.identifier, for: indexPath) as! SeatCollectionViewCell
        cell.setupSeat(seatsModel[indexPath.row])
        
        if selectedSeats.contains(indexPath.item) {
            cell.seatImageView.image = UIImage(named: "seat2")!
        } else {
            cell.seatImageView.image = UIImage(named: "seat")!
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedSeats.count >= 5 {
            if let index = selectedSeats.firstIndex(of: indexPath.item) {
                selectedSeats.remove(at: index)
            } else {
                let alert = UIAlertController(title: "Error", message: "You cannot select more than 5 seats", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
            collectionView.reloadItems(at: [indexPath])
            return
        }
        
        if let index = selectedSeats.firstIndex(of: indexPath.item) {
            selectedSeats.remove(at: index)
        } else {
            selectedSeats.append(indexPath.item)
        }
        collectionView.reloadItems(at: [indexPath])
    }
}
