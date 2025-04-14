//
//  GetHighwayDataResponse.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import Foundation

class GetHighwayDataResponse: Decodable {
    var requestId: String
    var statusCode: String
    var highwayVignettes: [HighwayVignette]
    var vehicleCategories: [VehicleCategory]
    var counties: [County]

    enum CodingKeys: String, CodingKey {
        case requestId, statusCode, payload
    }

    enum PayloadKeys: String, CodingKey {
        case highwayVignettes, vehicleCategories, counties
    }

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.requestId = try container.decode(String.self, forKey: .requestId)
        self.statusCode = try container.decode(String.self, forKey: .statusCode)

        let payload = try container.nestedContainer(keyedBy: PayloadKeys.self, forKey: .payload)
        self.highwayVignettes = try payload.decode([HighwayVignette].self, forKey: .highwayVignettes)
        self.vehicleCategories = try payload.decode([VehicleCategory].self, forKey: .vehicleCategories)
        self.counties = try payload.decode([County].self, forKey: .counties)
    }
}

extension GetHighwayDataResponse {

    static var mock: Data {
        return """
{
  "requestId": "123123",
  "statusCode": "OK",
  "payload": {
    "highwayVignettes": [
      {
        "vignetteType": [
          "DAY"
        ],
        "vehicleCategory": "CAR",
        "cost": 5150,
        "trxFee": 200,
        "sum": 5350
      },
      {
        "vignetteType": [
          "MONTH"
        ],
        "vehicleCategory": "CAR",
        "cost": 10360,
        "trxFee": 200,
        "sum": 10560
      },
      {
        "vignetteType": [
          "WEEK"
        ],
        "vehicleCategory": "CAR",
        "cost": 6400,
        "trxFee": 200,
        "sum": 6600
      },
      {
        "vignetteType": [
          "YEAR"
        ],
        "vehicleCategory": "CAR",
        "cost": 6660,
        "trxFee": 200,
        "sum": 6860
      },
      {
        "vignetteType": [
          "YEAR_11",
          "YEAR_12",
          "YEAR_13",
          "YEAR_14",
          "YEAR_15",
          "YEAR_16",
          "YEAR_17",
          "YEAR_18",
          "YEAR_19",
          "YEAR_20",
          "YEAR_21",
          "YEAR_22",
          "YEAR_23",
          "YEAR_24",
          "YEAR_25",
          "YEAR_26",
          "YEAR_27",
          "YEAR_28",
          "YEAR_29"
        ],
        "vehicleCategory": "CAR",
        "cost": 6660,
        "trxFee": 200,
        "sum": 6860
      }
    ],
    "vehicleCategories": [
      {
        "category": "CAR",
        "vignetteCategory": "D1",
        "name": {
          "hu": "Személygépjármű",
          "en": "Car"
        }
      }
    ],
    "counties": [
      {
        "id": "YEAR_11",
        "name": "Bács-Kiskun"
      },
      {
        "id": "YEAR_12",
        "name": "Baranya"
      },
      {
        "id": "YEAR_13",
        "name": "Békés"
      },
      {
        "id": "YEAR_14",
        "name": "Borsod-Abaúj-Zemplén"
      },
      {
        "id": "YEAR_15",
        "name": "Csongrád"
      },
      {
        "id": "YEAR_16",
        "name": "Fejér"
      },
      {
        "id": "YEAR_17",
        "name": "Győr-Moson-Sopron"
      },
      {
        "id": "YEAR_18",
        "name": "Hajdú-Bihar"
      },
      {
        "id": "YEAR_19",
        "name": "Heves"
      },
      {
        "id": "YEAR_20",
        "name": "Jász-Nagykun-Szolnok"
      },
      {
        "id": "YEAR_21",
        "name": "Komárom-Esztergom"
      },
      {
        "id": "YEAR_22",
        "name": "Nógrád"
      },
      {
        "id": "YEAR_23",
        "name": "Pest"
      },
      {
        "id": "YEAR_24",
        "name": "Somogy"
      },
      {
        "id": "YEAR_25",
        "name": "Szabolcs-Szatmár-Bereg"
      },
      {
        "id": "YEAR_26",
        "name": "Tolna"
      },
      {
        "id": "YEAR_27",
        "name": "Vas"
      },
      {
        "id": "YEAR_28",
        "name": "Veszprém"
      },
      {
        "id": "YEAR_29",
        "name": "Zala"
      }
    ]
  },
  "dataType": "HighwayTransaction"
}
""".data(using: .utf8)!
    }

}
