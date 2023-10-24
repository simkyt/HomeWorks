//
//  AppearenceViewController.swift
//  CalendarDayFinderApp
//
//  Created by Arkadijs Makarenko on 23/10/2023.
//

import UIKit

class AppearenceViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeItemTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openSettings(_ sender: Any) {
        //UIApplication.shared.open(URL(string: "App-prefs:General")!)
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    #warning("open settings")
    }
  
    func setLabelText(){
        let currentStyle = self.traitCollection.userInterfaceStyle
        switch currentStyle {
        case .light:
            textLabel.text = "Light Mode is On"
        case .dark:
            textLabel.text = "Dark Mode is On"
        default:
            textLabel.text = "Unable to specify UI style"
        }
    }
    #warning("set label depending on light/dark mode")
}

extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
