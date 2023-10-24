//
//  InfoViewController.swift
//  CalendarDayFinderApp
//
//  Created by Arkadijs Makarenko on 23/10/2023.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    var info: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #warning("assigned value to labels")
        appInfoLabel.text = info
        appDescLabel.text = desc
        // Do any additional setup after loading the view.
    }
}
