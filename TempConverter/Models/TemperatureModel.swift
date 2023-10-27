//
//  TemperatureModel.swift
//  TempConverter
//
//  Created by Simonas Kytra on 27/10/2023.
//

import Foundation

class TemperatureModel {
    enum Temperatures: String {
        case celsius = "Celsius"
        case fahrenheit = "Fahrenheit"
        case kelvin = "Kelvin"
    }
    
    var initialTemperature: Int = 0
    var convertedTemperature: Float = 32.0
    var fromUnit: Temperatures = .celsius
    var toUnit: Temperatures = .fahrenheit
    
    func convertTemperature() {
        convertedTemperature = convert(Float(initialTemperature), from: fromUnit, to: toUnit)
    }
        
    func convert(_ value: Float, from: Temperatures, to: Temperatures) -> Float {
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
