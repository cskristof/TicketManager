//
//  HighwayVignette.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

class HighwayVignette: Codable {
    var vignetteType: [String]
    var vehicleCategory: String
    var cost: Double
    var trxFee: Double
    var sum: Double

    var vignetteDescription: String {
        switch vignetteType {
        case ["DAY"]:
            String(localized: "vignette_type_day")
        case ["WEEK"]:
            String(localized: "vignette_type_week")
        case ["MONTH"]:
            String(localized: "vignette_type_month")
        case ["YEAR"]:
            String(localized: "vignette_type_year")
        default:
            String(localized: "vignette_type_yearly_regional")
        }
    }
}
