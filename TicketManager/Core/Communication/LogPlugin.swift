//
//  LogPlugin.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 09..
//

import Moya

struct LogPlugin: PluginType {

    func willSend(_ request: Moya.RequestType, target: Moya.TargetType) {
        if let log = createRequestLog(fromRequest: request) {
            print(log)
        }
    }

    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: Moya.TargetType) {
        let log = switch result {
        case .success(let response):
            createHttpResponseLog(fromResponse: response)
        case .failure(let error):
            createHttpResponseLog(fromResponse: error.response)
        }

        if let log {
            print(log)
        }
    }

    private func createRequestLog(fromRequest request: Moya.RequestType) -> String? {
        guard let URLRequest = request.request else { return nil }

        var log = "[Request][\(URLRequest.method!.rawValue)] URL: \(URLRequest.url!)"

        if !request.sessionHeaders.isEmpty {
            log += "\nSession Headers: \(headerToJson(request.sessionHeaders))"
        }

        if let headers = URLRequest.allHTTPHeaderFields {
            log += "\nRequest Headers: \(headerToJson(headers))"
        } else {
            log += "\nRequest Headers: Empty"
        }

        if URLRequest.httpBody == nil {
            log += "\nRequest Body: Empty"
        } else if let data = URLRequest.httpBody, let string = String(data: data, encoding: .utf8) {
            log += "\nRequest Body:"
            log += "\n\(string)"
        } else {
            log += "\nRequest Body: Cannot read this object"
        }

        return log
    }

    private func createHttpResponseLog(fromResponse response: Moya.Response?) -> String? {
        guard let HTTPResponse = response?.response else { return nil }

        var log = if let URLRequest = response?.request {
            "[Response][\(URLRequest.method!.rawValue)] URL: \(URLRequest.url!)"
        } else {
            ""
        }

        log += "\nStatus Code: \(HTTPResponse.statusCode)"
        log += "\nResponse Headers:"
        log += "\n\(headerToJson(HTTPResponse.allHeaderFields as! [AnyHashable:String]))"

        if let data = response?.data, let string = String(data: data, encoding: .utf8) {
            log += "\nResponse Body:"
            log += "\n\(string)"
        } else {
            log += "\nResponse Body: Cannot read this object"
        }

        return log
    }

    private func headerToJson(_ header: [AnyHashable : String]) -> String {
        let headerString = header.reduce("") {
            let current = "\"\($1.key)\": \"\($1.value)\""
            return $0 == "" ? current : "\($0), \(current)"
        }

        return "{\(headerString)}"
    }


}

