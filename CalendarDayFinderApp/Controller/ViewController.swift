//
//  ViewController.swift
//  CalendarDayFinderApp
//
//  Created by Arkadijs Makarenko on 23/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTexfiled: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultField: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    private var isWeekdayFound: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func findWeekDay(from date: Date){
        #warning("find day of the year on Find tap")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let weekdayName = formatter.string(from: date)
        resultField.text = weekdayName
        isWeekdayFound = true
    
        setTexts()
        //Calendar
        //DateCompontes
        //DateFormatter -> dateFormat
        
        //Logic Calculation, it can't be 0
        //present alert if something went wrong
        
        //Result is for presenting the Day of week
        
        //Title Find to Clear(clear all text filed to "")
    }
    
    @IBAction func findButtonTapped(_ sender: Any) {
        if !isWeekdayFound {
            let day = (dayTexfiled.text?.isEmpty == false) ? dayTexfiled.text! : "-1"
            let month = (monthTextField.text?.isEmpty == false) ? monthTextField.text! : "-1"
            let year = (yearTextField.text?.isEmpty == false) ? yearTextField.text! : "-1"
            
            if let validDate = getDate(day: day, month: month, year: year) {
                findWeekDay(from: validDate)
            } else {
                basicAlert(title: "Invalid date", message: "The input date is not correct")
            }
        } else {
            isWeekdayFound = false
            setTexts()
        }
    }
    
    func getDate(day: String, month: String, year: String) -> Date? {
        var components = DateComponents()
        components.day = Int(day)
        components.month = Int(month)
        components.year = Int(year)
        components.calendar = Calendar.current
        
        if components.isValidDate {
            return Calendar.current.date(from: components)
        } else {
            return nil
        }
    }
    
    func setTexts() {
        if isWeekdayFound {
            resultButton.setTitle("Clear", for:. normal)
            dayTexfiled.isUserInteractionEnabled = false
            monthTextField.isUserInteractionEnabled = false
            yearTextField.isUserInteractionEnabled = false
        } else {
            resultButton.setTitle("Find", for: .normal)
            resultField.text = "Result"
            dayTexfiled.text = ""
            monthTextField.text = ""
            yearTextField.text = ""
            dayTexfiled.isUserInteractionEnabled = true
            monthTextField.isUserInteractionEnabled = true
            yearTextField.isUserInteractionEnabled = true
        }
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            // Get the new view controller using segue.destination.
            guard let vc = segue.destination as? InfoViewController else { return }
            // Pass the selected object to the new view controller.
            if resultField.text == "Result" {
                vc.info = "No weekday found"
                vc.desc = ""
            } else {
                vc.info = "Your found weekday is"
                vc.desc = resultField.text
            }
        }
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
}
