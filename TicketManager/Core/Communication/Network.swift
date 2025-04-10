//
//  Network.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 09..
//

import Foundation
import Moya

class Network {

    static private let provider = MoyaProvider<MultiTarget>(plugins: [LogPlugin()])

    static func request(_ target: TargetType) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            provider.request(MultiTarget(target)) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response.data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

}
