//
//  DevicesView.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/17/23.
//

import SwiftUI
import CoreBluetooth

struct DevicesView: View {
    
    @StateObject private var viewModel: DevicesViewModel = .init()
    @State private var found: Bool = false
    @Binding var peripheral: CBPeripheral?
    @Environment(\.presentationMode) private var presentationMode
   /*
    private var peripherals: CBPeripheral? {
        for peripheral in viewModel.peripherals {
            if peripheral.name == "DSD TECH" {
                debugPrint("found")
                let p = peripheral
                self.peripheral = peripheral
                viewModel.identifier = peripheral.identifier.uuidString
                presentationMode.wrappedValue.dismiss()
                found = true
                return p
          
            }
        }
        return nil
    }*/
    
 
    
    //@State var found = false

    var body: some View {
            contentView
               /* .onAppear {
                    viewModel.start()
                    }*/
    }
     
    
    
    //MARK: - Private
    
    @ViewBuilder
    private var contentView: some View {
        //if viewModel.state == .poweredOn {
        VStack {
                Image("bt")
                    .resizable()
                    .frame(width: 150, height: 215)
                Text("Connecting...").font(
                    .system(size: 30, weight:.medium))
            }
        .onAppear {
            viewModel.start()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                presentationMode.wrappedValue.dismiss()
                
            }}

       // }
       // else {
          //  Text("Please enable bluetooth to search devices")
        //}
    }
}

struct DevicesView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesView(peripheral: .constant(nil))
    }
}
