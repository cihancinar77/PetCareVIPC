//
//  AppointmentsPresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

protocol AppointmentsPresenterProtocol: AnyObject {
    func setupInitialState(upcomingAppointments: [AppointmentModel], pastAppointments: [AppointmentModel], segmentedControlIndex: Int)
}

final class AppointmentsPresenter: AppointmentsPresenterProtocol {

	weak var viewController: AppointmentsViewControllerProtocol?

    func setupInitialState(upcomingAppointments: [AppointmentModel], pastAppointments: [AppointmentModel], segmentedControlIndex: Int) {
        var appointmentsModel: [AppointmentModel] = []
        if segmentedControlIndex == 0 {
            appointmentsModel = upcomingAppointments
        } else if segmentedControlIndex == 1 {
            appointmentsModel = pastAppointments
        }
        var tableViewModel: [AppointmentsTableViewModel] = []
        for item in appointmentsModel {
			
            let model = AppointmentsTableViewModel(
                image: item.image,
                name: item.name,
                title: item.title,
                rating: item.rating,
                numberOfReviews: "\(item.numberOfReviews) Reviews",
                distance: "\(item.distance) km",
                cost: "$\(item.cost)",
                facilityName: item.facilityName,
                adress: item.adress,
                date: item.date,
                time: item.time,
                isEditable: item.isEditable,
                isCancellationEnabled: item.isCancellationEnabled
            )
            tableViewModel.append(model)
        }
        viewController?.display(viewState: .initial(tableViewModel: tableViewModel, selectedSegmentIndex: segmentedControlIndex))
	}
}
