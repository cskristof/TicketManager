//
//  SplashInteractor.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

import Foundation

protocol SplashInteractorDelegate: AnyObject {
    func presentSelectorScreen(vehicle: VehicleModel, highwayData: GetHighwayDataResponse)
}

class SplashInteractor: SplashViewControllerDelegate {

    var presenter: SplashInteractorDelegate?

    func fetchRequiredData() {
        Task {
            async let asyncVehicle = fetchVehicleData()
            async let asyncTicketData = fetchTicketData()

            do {
                let vehicle = try await asyncVehicle
                let ticketData = try await asyncTicketData

                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.presentSelectorScreen(vehicle: vehicle, highwayData: ticketData)
                }
            } catch let exp {
                print(exp)
                // TODO: Error handling
            }
        }
    }

    func fetchVehicleData() async throws -> VehicleModel {
        let responseData = try await Network.request(TicketRouter.getVehicleData)

        let response = try JSONDecoder().decode(GetVehicleDataResponse.self, from: responseData)

        return response.vehicle
    }

    func fetchTicketData() async throws -> GetHighwayDataResponse {
        let responseData = try await Network.request(TicketRouter.getHighwayData)

        let response = try JSONDecoder().decode(GetHighwayDataResponse.self, from: responseData)

        return response
    }

}
