//
//  VehicleModel.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 10..
//

class VehicleModel: Codable {

    var internationalRegistrationCode: String
    var type: String
    var name: String
    var plate: String
    var country: LocalizedString
    var vignetteType: String

    init(internationalRegistrationCode: String, type: String, name: String, plate: String, country: LocalizedString, vignetteType: String) {
        self.internationalRegistrationCode = internationalRegistrationCode
        self.type = type
        self.name = name
        self.plate = plate
        self.country = country
        self.vignetteType = vignetteType
    }

}
