//
//  AppointmentsInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import Foundation

protocol AppointmentsInteractorProtocol: AnyObject {
    func viewDidLoad()
    func didSegmentValueChanged(selected: Int)
}

protocol AppointmentsInteractorCoordinatorDelegate: AnyObject {
    
}

final class AppointmentsInteractor {
    
    private var timer: Timer?
    private var currentDateAndTime = ""
    private var appointments: [AppointmentModel] = []
    private var upcomingAppointments: [AppointmentModel] = []
    private var pastAppointments: [AppointmentModel] = []
    private var segmentedControlIndex = 0
    
    weak var coordinator: AppointmentsInteractorCoordinatorDelegate?
    private let presenter: AppointmentsPresenterProtocol
    
    init(presenter: AppointmentsPresenterProtocol) {
        self.presenter = presenter
    }
    
    deinit {
        timer?.invalidate()
    }
    // MARK: - APPOINTMENTS JSON TO MODEL
    private func fetchViewModel(completion: @escaping ([AppointmentModel]) -> Void) {
        do {
            if let bundlePath = Bundle.main.path(forResource: "appointments", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
            {
                let result = try JSONDecoder().decode([AppointmentModel].self, from: jsonData)
                completion(result)
            }
        } catch {
            print(error)
        }
    }
    
    private func compareDateTimes(currentDateAndTime: String, appointmentDateAndTime: String) -> Bool{
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateTimeFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let dateTime1 = dateTimeFormatter.date(from: currentDateAndTime), let dateTime2 = dateTimeFormatter.date(from: appointmentDateAndTime) {
            if dateTime1 < dateTime2 {
                return true
            } else if dateTime1 > dateTime2 {
                return false
            } else {
                return true
            }
        } else {
			// TODO: (Cihan) Buraya bakmam lazım
            print("Invalid date and time format.")
            return false
        }
    }
    
    // MARK: - TIME BASED VIEW, UPDATES SCREEN
    @objc func updateDateTime() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let formattedDate = dateFormatter.string(from: currentDate)
        self.currentDateAndTime = formattedDate
       
        fetchViewModel { appointments in
            var upcomingAppointments: [AppointmentModel] = []
            var pastAppointments: [AppointmentModel] = []
            for appointment in appointments {
                let appointmentDateAndTime = "\(appointment.date) \(appointment.time)"
                if self.compareDateTimes(currentDateAndTime: self.currentDateAndTime, appointmentDateAndTime: appointmentDateAndTime ) {
                    let upcomingAppointment = appointment
                    upcomingAppointments.append(upcomingAppointment)
                } else {
                    let pastAppointment = appointment
                    pastAppointments.append(pastAppointment)
                }
            }
            self.upcomingAppointments = upcomingAppointments
            self.pastAppointments = pastAppointments
        }
        //PRESENTER UPDATES VIEWCONTROLLER EVERY 30 SEC
        presenter.setupInitialState(upcomingAppointments: upcomingAppointments, pastAppointments: pastAppointments, segmentedControlIndex: segmentedControlIndex)
        print("Current Date and Time: \(formattedDate)")
    }
}

// MARK: - AppointmentsInteractorProtocol
extension AppointmentsInteractor: AppointmentsInteractorProtocol {
    
    func viewDidLoad() {
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(updateDateTime), userInfo: nil, repeats: true)
        updateDateTime()
    }
    
    func didSegmentValueChanged(selected: Int) {
        self.segmentedControlIndex = selected
        presenter.setupInitialState(upcomingAppointments: self.upcomingAppointments, pastAppointments: self.pastAppointments, segmentedControlIndex: self.segmentedControlIndex)
    }
}



//   private func dateFormatter(dateString: String) {
//       let dateFormatter = DateFormatter()
//       dateFormatter.dateFormat = "yyyy-MM-dd"
//       dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//
//       if let date = dateFormatter.date(from: dateString) {
//           print("Converted Date: \(date)")
//       } else {
//           print("Unable to convert the string to a date.")
//       }
//   }
//
//   private func timeFormatter(timeString: String) {
//       let timeFormatter = DateFormatter()
//       timeFormatter.dateFormat = "HH:mm"
//       timeFormatter.locale = Locale(identifier: "en_US_POSIX")
//
//       if let time = timeFormatter.date(from: timeString) {
//           let calendar = Calendar.current
//           let components = calendar.dateComponents([.hour, .minute], from: time)
//
//           if let hour = components.hour, let minute = components.minute {
//               print("Converted Time: \(hour):\(minute)")
//           }
//       } else {
//           print("Unable to convert the string to a time.")
//       }
//   }
