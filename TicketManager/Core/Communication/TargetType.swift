//
//  TargetType.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 09..
//

import Moya

protocol TargetType: Moya.TargetType {

    /// The query parameters to be used in the request.
    var queryParameters: [String: Any]? { get }

    /// The body parameters to be used in the request.
    var bodyParameters: [String: Any]? { get }

}

extension TargetType {

    var headers: [String : String]? {
        nil
    }

    var queryParameters: [String: Any]? {
        nil
    }

    var task: Task {
        return defaultTask
    }

    /**
     Default task implementation.

     bodyParameters encoded with `JSONEncoding.default`

     queryParameters encoded with `URLEncoding.default`
     */
    var defaultTask: Task {
        switch (bodyParameters, queryParameters) {
        case let (body?, query?):
            return .requestCompositeParameters(bodyParameters: body, bodyEncoding: JSONEncoding.default, urlParameters: query)
        case let (body?, _):
            return .requestParameters(parameters: body, encoding: JSONEncoding.default)
        case let (_, query?):
            return .requestParameters(parameters: query, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }

    /// Default validation type `.successCodes`
    var validationType: ValidationType {
        return .successCodes
    }

}

