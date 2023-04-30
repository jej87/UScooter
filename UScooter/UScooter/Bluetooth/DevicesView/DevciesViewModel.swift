//
//  DevciesViewModel.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/17/23.
//

import SwiftUI
import CoreBluetooth
import Combine

final class DevicesViewModel: ObservableObject {
    
    @AppStorage("identifier") var identifier: String = ""
    @Published var state: CBManagerState = .unknown
    @Published var peripherals: [CBPeripheral] = []

    private lazy var manager: BluetoothManager = .shared
    private lazy var cancellables: Set<AnyCancellable> = .init()

 
    func start() {
        manager.stateSubject
            .sink { [weak self] state in
                self?.state = state
                if state == .poweredOn {
                    self?.manager.scan()
                }
            }
            .store(in: &cancellables)
        manager.peripheralSubject
            .filter { [weak self] in self?.peripherals.contains($0) == false }
            .sink { [weak self] in
                print($0)
                self?.peripherals.append($0)
            }
            .store(in: &cancellables)
        manager.start()
    }
}

