//
//  EmptyView.swift
//  BusTicket
//
//  Created by Agah Berkin Güler on 27.04.2024.
//

import UIKit

class EmptyView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        // Add your empty view UI elements here, like labels or images
        let label = UILabel()
        label.text = "No items to display"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
