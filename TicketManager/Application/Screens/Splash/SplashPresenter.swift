//
//  SplashPresenter.swift
//  TicketManager
//
//  Created by Csapó Kristóf on 2025. 04. 14..
//

protocol SplashPresenterDelegate: AnyObject {
    func navigateToTicketSelector(data: TicketSelectorViewController.ScreenData)
}

class SplashPresenter: SplashInteractorDelegate {

    weak var viewController: SplashPresenterDelegate?

    func presentSelectorScreen(vehicle: VehicleModel, highwayData: GetHighwayDataResponse) {
        let data = TicketSelectorViewController.ScreenData(
            vehicle: vehicle,
            vehicleCategory: highwayData.vehicleCategories.first { $0.category == vehicle.type },
            highwayTickets: highwayData.highwayVignettes,
            counties: highwayData.counties)

        viewController?.navigateToTicketSelector(data: data)
    }

}
