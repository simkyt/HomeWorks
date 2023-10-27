//
//  ViewController.swift
//  TempConverter
//
//  Created by Arkadijs Makarenko on 26/10/2023.
//

import UIKit

class ViewController: UIViewController, TemperatureDataDelegate {

    @IBOutlet weak var initialTempLabel: UILabel!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempConvFromControl: UISegmentedControl!
    @IBOutlet weak var tempConvToControl: UISegmentedControl!
    var temperatureModel = TemperatureModel()
    
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
    
    func getTemperatureModel() -> TemperatureModel {
        return temperatureModel
    }
    
    @IBAction func navBarButtonPressed(_ sender: Any) {
        let infoViewController = InfoViewController()
//        infoViewController.temperatureModel = self.temperatureModel //// simply via injecting the property instead of delegate protocol
        infoViewController.delegate = self
    //    present(infoViewController, animated: true)
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
           let fromScale = TemperatureModel.Temperatures(rawValue: fromTitle),
           let toScale = TemperatureModel.Temperatures(rawValue: toTitle) {
            
            temperatureModel.initialTemperature = Int(value)
            temperatureModel.fromUnit = fromScale
            temperatureModel.toUnit = toScale
            temperatureModel.convertTemperature()
            
            initialTempLabel.text = "\(temperatureModel.initialTemperature) º\(fromTitle.prefix(1))"
            convertedTempLabel.text = "\(temperatureModel.convertedTemperature.formattedTemp(unit: toTitle))"
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
}
#warning("pass result to InfoVC without segue")
