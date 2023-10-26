//
//  InfoViewController.swift
//  TempConverter
//
//  Created by Simonas Kytra on 26/10/2023.
//

import UIKit

class InfoViewController: UIViewController {

    var initialTempLabel: UILabel!
    var additionalLabel: UILabel!
    var convertedTempLabel: UILabel!
    var initialTemp: String?
    var convertedTemp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initialTempLabel = UILabel()
        initialTempLabel.translatesAutoresizingMaskIntoConstraints = false
        initialTempLabel.text = initialTemp ?? "something"
        initialTempLabel.textColor = .black
        view.addSubview(initialTempLabel)
        
        additionalLabel = UILabel()
        additionalLabel.translatesAutoresizingMaskIntoConstraints = false
        additionalLabel.text = "really is"
        additionalLabel.textColor = .black
        view.addSubview(additionalLabel)
        
        convertedTempLabel = UILabel()
        convertedTempLabel.translatesAutoresizingMaskIntoConstraints = false
        convertedTempLabel.text = convertedTemp ?? "wrong"
        convertedTempLabel.textColor = .black
        view.addSubview(convertedTempLabel)
        
        NSLayoutConstraint.activate([
            initialTempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            initialTempLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            
            additionalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            additionalLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            convertedTempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            convertedTempLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
    }
}
