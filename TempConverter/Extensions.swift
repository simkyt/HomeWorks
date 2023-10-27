//
//  Extensions.swift
//  TempConverter
//
//  Created by Simonas Kytra on 27/10/2023.
//

import Foundation

extension Float {
    func formattedTemp(unit: String) -> String {
        if floor(self) == self {
            return String(format: "%.0f º\(unit.prefix(1))", self)
        } else {
            return String(format: "%.2f º\(unit.prefix(1))", self)
        }
    }
}
