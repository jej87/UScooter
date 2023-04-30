//
//  Bluetooth_Discovery.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/8/23.
//

import Foundation
import CoreBluetooth

let btDiscoverySharedInstance = Bluetooth_Discovery();

class Bluetooth_Discovery: NSObject, CBCentralManagerDelegate {
  
  fileprivate var centralManager: CBCentralManager?
  fileprivate var peripheralBT: CBPeripheral?
  
  //scanning for bluetooth devices
  func startScanning() {
    if let central = centralManager {
      central.scanForPeripherals(withServices: [ServiceUUID], options: nil)
        debugPrint("Starting Scanning")
    }
  }
  
  //creating instance of bluetooth service
  var UService: Bluetooth_Service? {
    didSet {
      if let service = self.UService {
        service.startDiscoveringServices()
          debugPrint("Starting Service")
      }
    }
  }
  
  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
    
    // Validate peripheral information
    if ((peripheral.name == nil) || (peripheral.name == "")) {
      return
    }
    
    // If not already connected to a peripheral and name is DSD TECH, then connect to this one
      if ((self.peripheralBT == nil) || (self.peripheralBT?.state == CBPeripheralState.disconnected) && (peripheral.name == "DSD TECH")) {
      // Retain the peripheral before trying to connect
      self.peripheralBT = peripheral
      
      // Reset service
      self.UService = nil
      
      // Connect to peripheral
      central.connect(peripheral, options: nil)
    }
  }
  
  func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
    
    // Create new service class
    if (peripheral == self.peripheralBT) {
      self.UService = Bluetooth_Service(initWithPeripheral: peripheral)
    }
    
    // Stop scanning for new devices
    central.stopScan()
  }
  
  func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
    
    // See if it was our peripheral that disconnected
    if (peripheral == self.peripheralBT) {
      self.UService = nil;
      self.peripheralBT = nil;
    }
    
    // Start scanning for new devices
    self.startScanning()
  }
  
  func clearDevices() {
    self.UService = nil
    self.peripheralBT = nil
  }
  
  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    switch (central.state) {
    case .poweredOff:
      self.clearDevices()
      
    case .unauthorized:
      // Indicate to user that the iOS device does not support BLE.
      break
      
    case .unknown:
      // Wait for another event
      break
      
    case .poweredOn:
      self.startScanning()
      
    case .resetting:
      self.clearDevices()
      
    case .unsupported:
      break
        
    @unknown default:
        break
    }
  }

}

