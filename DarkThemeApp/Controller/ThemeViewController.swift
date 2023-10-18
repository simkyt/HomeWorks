//
//  ThemeViewController.swift
//  DarkThemeApp
//
//  Created by Arkadijs Makarenko on 18/10/2023.
//

import UIKit

class ThemeViewController: UIViewController {
    
    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var folderButton: UIBarButtonItem!
    @IBOutlet weak var someItemButton: UIBarButtonItem!
    var isDarkTheme = false
    
#warning("need to have IBOutlet for Item button and put on leading side")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ThemeViewController func viewDidLoad")
        darkButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func darkButtonTapped(_ sender: Any) {
        print("darkButtonTapped")
        
        UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            let backgroundColor: UIColor = self.isDarkTheme ? .white : .black
            let navBarTextColor: UIColor = self.isDarkTheme ? .black : .white
            let buttonTitle: String = self.isDarkTheme ? "Dark Theme on" : "Dark Theme off"
            let buttonTitleColor: UIColor = self.isDarkTheme ? .white : .black
            let buttonTintColor: UIColor = self.isDarkTheme ? .black : .white
            
            self.view.backgroundColor = backgroundColor
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: navBarTextColor]
            
            self.darkButton.setTitle(buttonTitle, for: .normal)
            self.darkButton.setTitleColor(buttonTitleColor, for: .normal)
            self.darkButton.tintColor = buttonTintColor
        }, completion: nil)
        
        isDarkTheme.toggle()
#warning("Dark Theme off : Dark Theme on")
    }
    
    @IBAction func folderTaped(_ sender: Any) {
        basicAlert(title: "My Folder", message: "This is my item button!")
    }
#warning("need to have IBAction for Item button and logic to present actionSheet")
    
    @IBAction func someItemTapped(_ sender: Any) {
        actionSheetAlert(title: "someItem", message: "This is some item")
    }
    
}

extension UIViewController {
    
    func basicAlert(title: String?, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    func actionSheetAlert(title: String?, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "some option no. 1", style: .default, handler: { _ in
                print("option no. 1 selected")
            }))

            alert.addAction(UIAlertAction(title: "some option no. 2", style: .default, handler: { _ in
                print("option no. 2 selected")
            }))

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
}

