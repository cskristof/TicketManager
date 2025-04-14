//
//  TicketRouter.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import Foundation
import Moya

enum TicketRouter {
    case getHighwayData
    case getVehicleData
    case createOrder
}

extension TicketRouter: TargetType {

    var baseURL: URL {
        // TODO: Move to environmental file
        URL(string: "localhost:8080")!
    }

    var path: String {
        switch self {
        case .getHighwayData:
            return "/v1/highway/info"
        case .getVehicleData:
            return "/v1/highway/vehicle"
        case .createOrder:
            return "/v1/highway/order"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getHighwayData, .getVehicleData:
            return .get
        case .createOrder:
            return .post
        }
    }

    var bodyParameters: [String : Any]? {
        nil
    }

    var sampleData: Data {
        return switch self {
        case .getVehicleData:
            GetVehicleDataResponse.mock
        case .getHighwayData:
            GetHighwayDataResponse.mock
        default:
            Data()
        }
    }

}
