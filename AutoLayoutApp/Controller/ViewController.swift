//
//  ViewController.swift
//  AutoLayoutApp
//
//  Created by Arkadijs Makarenko on 20/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet var styleOutletsCollection: [UIButton]!
    var color1 = UIColor(red: 0.4322142885, green: 0.9718759656, blue: 0.7847494466, alpha: 1.0)
    var color2 = UIColor(red: 1.0, green: 0.1083200715, blue: 0.2086823998, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleOutletsCollection.forEach { button in
            button.layer.cornerRadius = 12
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBAction func buttonTheme_tapped(_ sender: Any) {
        navigationController?.navigationBar.backgroundColor = (navigationController?.navigationBar.backgroundColor == color1) ? color2 : color1
        
        styleOutletsCollection.forEach { button in
            button.backgroundColor = (button.backgroundColor == color1) ? color2 : color1
        }
    }

    
    @IBAction func showButton_tapped(_ sender: UIButton) {
        sender.setTitle((sender.configuration?.title == "Show less") ? "Show more" : "Show less", for: .normal)
        
        styleOutletsCollection.forEach { button in
            if button != sender {
                button.isHidden.toggle()
            }
        }
    }
    
    
    
    @IBAction func viewStyleOne_Tapped(_ sender: Any) {
        applyStyle(
            color1: UIColor(red: 0.4322142885, green: 0.9718759656, blue: 0.7847494466, alpha: 1.0),
            color2: UIColor(red: 1.0, green: 0.1083200715, blue: 0.2086823998, alpha: 1.0),
            imageSystemName: "rectangle.and.pencil.and.ellipsis.rtl",
            imageTintColor: UIColor.systemBlue,
            backgroundColor: UIColor.white
        )
    }
    
    @IBAction func viewStyleTwo_tapped(_ sender: Any) {
        applyStyle(
            color1: UIColor.blue,
            color2: UIColor.systemYellow,
            imageSystemName: "heart",
            imageTintColor: UIColor.red,
            backgroundColor: UIColor.black
        )
    }
    
    @IBAction func viewStyleThree_tapped(_ sender: Any) {
        applyStyle(
            color1: UIColor.magenta,
            color2: UIColor.cyan,
            imageSystemName: "heart.fill",
            imageTintColor: UIColor.red,
            backgroundColor: UIColor.yellow
        )
    }
    
    func applyStyle(color1: UIColor, color2: UIColor, imageSystemName: String, imageTintColor: UIColor, backgroundColor: UIColor) {
        let previousColor1: UIColor = self.color1
        
        self.color1 = color1
        self.color2 = color2
        
        navigationController?.navigationBar.backgroundColor = (navigationController?.navigationBar.backgroundColor == previousColor1) ? color1 : color2
        
        viewImage.image = UIImage(systemName: imageSystemName)
        viewImage.tintColor = imageTintColor
        self.view.backgroundColor = backgroundColor
        
        styleOutletsCollection.forEach { button in
            button.backgroundColor = (button.backgroundColor == previousColor1) ? color1 : color2
        }
    }
#warning("Button A,B should be on the bottom of the screen, CDE, on the top")
#warning("add button style: icon, title, color")
#warning("when press on button I'm hiding some buttons, or changing the view color, image")

    
}

