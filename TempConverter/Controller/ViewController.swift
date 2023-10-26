//
//  ViewController.swift
//  TempConverter
//
//  Created by Arkadijs Makarenko on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var initialTempLabel: UILabel!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempConvFromControl: UISegmentedControl!
    @IBOutlet weak var tempConvToControl: UISegmentedControl!
    var initialTemp: String = "0 ºC"
    var convertedTemp: String = "32 ºF"
    
    @IBOutlet weak var tempSlider: UISlider!{
        didSet {
            tempSlider.value = 0
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedTempLabel.text = "32 ºF"
        tempConvToControl.setEnabled(false, forSegmentAt: 0)
    }
    
    @IBAction func navBarButtonPressed(_ sender: Any) {
        let infoViewController = InfoViewController()
        infoViewController.initialTemp = initialTemp
        infoViewController.convertedTemp = convertedTemp
        navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    @IBAction func convFromValueChanged(_ sender: Any) {
        tempSlider.value = 0
        handleSegmentVisibility()
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    @IBAction func convToValueChanged(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    @IBAction func slderValueChanged(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    func updateTempLabelFromSlider(value: Float) {
        let fromIndex = tempConvFromControl.selectedSegmentIndex
        let toIndex = tempConvToControl.selectedSegmentIndex
        
        if let fromTitle = tempConvFromControl.titleForSegment(at: fromIndex),
           let toTitle = tempConvToControl.titleForSegment(at: toIndex),
           let fromScale = Temperatures(rawValue: fromTitle),
           let toScale = Temperatures(rawValue: toTitle) {
            
            initialTempLabel.text = "\(Int(value)) º\(fromTitle.prefix(1))"
            let convertedValue = TemperatureConverter.convert(Int(value), from: fromScale, to: toScale)
            
            var formatString: String
            if floor(convertedValue) == convertedValue {
                formatString = "%.0f º\(toTitle.prefix(1))"
            } else {
                formatString = "%.2f º\(toTitle.prefix(1))"
            }
            
            convertedTempLabel.text = String(format: formatString, convertedValue)
            
            initialTemp = initialTempLabel.text!
            convertedTemp = convertedTempLabel.text!
        } else {
            fatalError("something went terribly wrong")
        }
    }
    
    func handleSegmentVisibility() {
        let fromIndex = tempConvFromControl.selectedSegmentIndex
        let toIndex = tempConvToControl.selectedSegmentIndex
        
        // a bit hacky, but this makes sure all segments are enabled
        for i in 0..<tempConvToControl.numberOfSegments {
            tempConvToControl.setEnabled(true, forSegmentAt: i)
        }
        
        tempConvToControl.setEnabled(false, forSegmentAt: fromIndex)
        
        // switches the selected segment in tempConvToControl if the selected segment got disabled
        if toIndex == fromIndex {
            let nextIndex = (fromIndex + 1) % tempConvToControl.numberOfSegments
            tempConvToControl.selectedSegmentIndex = nextIndex
        }
    }
    
    enum Temperatures: String {
        case celsius = "Celsius"
        case fahrenheit = "Fahrenheit"
        case kelvin = "Kelvin"
    }

    struct TemperatureConverter {
        
        static func convert(_ value: Int, from: Temperatures, to: Temperatures) -> Float {
            var value = Float(value)
            switch (from, to) {
            case (.celsius, .fahrenheit):
                return value * 9/5 + 32
            case (.celsius, .kelvin):
                return value + 273.15
            case (.fahrenheit, .celsius):
                return (value - 32) * 5/9
            case (.fahrenheit, .kelvin):
                return (value - 32) * 5/9 + 273.15
            case (.kelvin, .celsius):
                return value - 273.15
            case (.kelvin, .fahrenheit):
                return (value - 273.15) * 9/5 + 32
            default:
                return value
            }
        }
        
    }
}
#warning("pass result to InfoVC without segue")
