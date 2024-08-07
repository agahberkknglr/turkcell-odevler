//
//  ViewController.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 25.04.2024.
//

import UIKit
import CoreData

class SearchTicketViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var departCityTextField: UITextField!
    @IBOutlet weak var arriveCityTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: Variables
    let pickerView = UIPickerView()
    let toolbar = UIToolbar()
    let dateFormatter = DateFormatter()
    let cities = ["Adana", "Ankara", "Antalya", "Istanbul", "Izmir", "Manisa", "Samsun", "Sivas", "Zonguldak"]
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        departCityTextField.inputView = pickerView
        arriveCityTextField.inputView = pickerView
        
        setToolBar(for: departCityTextField)
        setToolBar(for: arriveCityTextField)
        
        setDatePicker()
    }
    
    //MARK: Functions
    func setToolBar(for textField: UITextField) {
        toolbar.sizeToFit()
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([cancelButton, flexibleSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
    }
    
    func setDatePicker() {
        dateFormatter.dateFormat = "dd/MM/yyyy"
        datePicker.datePickerMode = .date
    }
    
    @objc func cancelButtonTapped() {
        if departCityTextField.isFirstResponder {
            departCityTextField.text = ""
            departCityTextField.resignFirstResponder()
        } else if arriveCityTextField.isFirstResponder {
            arriveCityTextField.text = ""
            arriveCityTextField.resignFirstResponder()
        }
    }
    
    @objc func doneButtonTapped() {
        if departCityTextField.isFirstResponder {
            departCityTextField.resignFirstResponder()
        } else if arriveCityTextField.isFirstResponder {
            arriveCityTextField.resignFirstResponder()
        }
    }

    @IBAction func changeDirectionButtonClickked(_ sender: UIButton) {
        (departCityTextField.text, arriveCityTextField.text) = (arriveCityTextField.text, departCityTextField.text)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        view.endEditing(true)
    }
    @IBAction func searchTicketsButtonClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListTicketViewController") as! ListTicketViewController
        if let arriveCity = arriveCityTextField.text, let departCity = departCityTextField.text,
           !arriveCity.isEmpty, !departCity.isEmpty, arriveCity != departCity {
            vc.arriveCity = arriveCity
            vc.departCity = departCity
            vc.dateText = dateFormatter.string(from: datePicker.date)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Departure and Arrival cities cannot be empty or the same.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}

//MARK: Extensions
extension SearchTicketViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if departCityTextField.isFirstResponder {
                    departCityTextField.text = cities[row]
        } else if arriveCityTextField.isFirstResponder {
                    arriveCityTextField.text = cities[row]
        }
        
    }
    
}
