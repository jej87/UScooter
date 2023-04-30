//
//  Bluetooth_Service.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/8/23.
//

import Foundation
import CoreBluetooth

/* Services & Characteristics UUIDs */
let ServiceUUID = CBUUID(string: "0xFFE0")
let PositionCharUUID = CBUUID(string: "0xFFE1")
let ServiceChangedStatusNotification = "kBLEServiceChangedStatusNotification"

class Bluetooth_Service: NSObject, CBPeripheralDelegate {
  var peripheral: CBPeripheral?
  var characteristic: CBCharacteristic?
  
  init(initWithPeripheral peripheral: CBPeripheral) {
    super.init()
    
    self.peripheral = peripheral
    self.peripheral?.delegate = self
  }
  
  deinit {
    self.reset()
  }
  
  func startDiscoveringServices() {
    self.peripheral?.discoverServices([ServiceUUID])
  }
  
  func reset() {
    if peripheral != nil {
      peripheral = nil
    }
    
    // Deallocating therefore send notification
    self.sendBTServiceNotificationWithIsBluetoothConnected(false)
  }
  
  
  func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
    let uuidsForBTService: [CBUUID] = [PositionCharUUID]
    
    if (peripheral != self.peripheral) {
      // Wrong Peripheral
      return
    }
    
    if (error != nil) {
      return
    }
    
    if ((peripheral.services == nil) || (peripheral.services!.count == 0)) {
      // No Services
      return
    }
    
    for service in peripheral.services! {
      if service.uuid == ServiceUUID {
        peripheral.discoverCharacteristics(uuidsForBTService, for: service)
      }
    }
  }
  
  func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
    if (peripheral != self.peripheral) {
      // Wrong Peripheral
      return
    }
    
    if (error != nil) {
      return
    }
    
    if let characteristics = service.characteristics {
      for characteristic in characteristics {
        if characteristic.uuid == PositionCharUUID {
          self.characteristic = (characteristic)
          peripheral.setNotifyValue(true, for: characteristic)
          
          // Send notification that Bluetooth is connected and all required characteristics are discovered
          self.sendBTServiceNotificationWithIsBluetoothConnected(true)
        }
      }
    }
  }
  
    //change this to write HIGH or low
    //extend rod = 7 - high, 8 - low (1)
    //retract rod = 7 - low, 8 - high (2)
    
    //TO DO - write position
    func writeValue(_ value: Int) {
    var temp = value
    let data = Data(bytes: &temp, count: 1)
    peripheral?.writeValue(data, for: characteristic!, type: .withoutResponse)
    }
    
  
  func sendBTServiceNotificationWithIsBluetoothConnected(_ isBluetoothConnected: Bool) {
    let connectionDetails = ["isConnected": isBluetoothConnected]
    NotificationCenter.default.post(name: Notification.Name(rawValue: ServiceChangedStatusNotification), object: self, userInfo: connectionDetails)
  }
  
}
