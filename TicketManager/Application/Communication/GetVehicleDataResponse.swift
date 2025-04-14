//
//  GetVehicleDataResponse.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import Foundation

class GetVehicleDataResponse: NSObject, Decodable {
    var statusCode: String
    var vehicle: VehicleModel

    enum CodingKeys: String, CodingKey {
        case statusCode
    }

    required init(from decoder: any Decoder) throws {
        statusCode = try decoder.container(keyedBy: CodingKeys.self).decode(String.self, forKey: .statusCode)
        vehicle = try VehicleModel(from: decoder)
    }

}

extension GetVehicleDataResponse {

    static var mock: Data {
        return """
{
  "requestId": "245735",
  "statusCode": "OK",
  "internationalRegistrationCode": "H",
  "type": "CAR",
  "name": "Michael Scott",
  "plate": "abc-123",
  "country": {
    "hu": "Magyarország",
    "en": "Hungary"
  },
  "vignetteType": "D1"
}
""".data(using: .utf8)!
    }

}
