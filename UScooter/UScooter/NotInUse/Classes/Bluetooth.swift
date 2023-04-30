//
//  Bluetooth.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/15/23.
//

import Foundation
import CoreBluetooth

class BTManagerrrrr: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
var centralManager: CBCentralManager?
var peripheral: CBPeripheral?
var characteristic: CBCharacteristic?
let serviceUUID = CBUUID(string: "0xFFE0")
let characteristicUUID = CBUUID(string: "0xFFE1")
    
    
override init() {
super.init()
centralManager = CBCentralManager(delegate: self, queue: nil)
}
 
//scanning for bluetooth
func centralManagerDidUpdateState(_ central: CBCentralManager) {
if central.state == .poweredOn {
print("Bluetooth is scanning")
central.scanForPeripherals(withServices: [serviceUUID], options: nil)
}
}

//if dsd tech module then connect
func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
if peripheral.name == "DSD TECH" {
central.stopScan()
self.peripheral = peripheral
peripheral.delegate = self
central.connect(peripheral, options: nil)
}
}
  
//notify that bluetooth is connected
func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
peripheral.discoverServices([serviceUUID])
print("Device connected")
}
    
//reading from bluetooth
func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
if let services = peripheral.services {
for service in services {
peripheral.discoverCharacteristics([characteristicUUID], for: service)
}
}
}
    
func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
if let characteristics = service.characteristics {
for characteristic in characteristics {
if characteristic.uuid == characteristicUUID {
self.characteristic = characteristic
peripheral.setNotifyValue(true, for: characteristic)
}
}
}
}
    
func writeValue(_ value: Int) {
var temp = value
let data = Data(bytes: &temp, count: 1)
peripheral?.writeValue(data, for: characteristic!, type: .withoutResponse)
}
}
