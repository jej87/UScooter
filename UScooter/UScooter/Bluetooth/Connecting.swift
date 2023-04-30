//
//  Connecting.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/17/23.
//

import SwiftUI
import CoreBluetooth

struct Connecting: View {
    @StateObject private var viewModel: MainViewModel = .init()
    @State private var devicesViewIsPresented = true
    
   /* func addToProf(){
        if let peripheral = viewModel.peripheral{
            Rack.RACK = "You are connected to Rack 1"
        }
        else{
            Rack.RACK = "No Rack Connections Found"
        }
    }*/
    
    
    var body: some View {
        NavigationView{
            content()
        }
        .onAppear {
            viewModel.start()
        }
        .sheet(isPresented: $devicesViewIsPresented) {
            DevicesView(peripheral: $viewModel.peripheral)
        }
            
    }
    
    
    @ViewBuilder
    private func content() -> some View {
     
            if viewModel.state != .poweredOn {
                Text("Enable Bluetooth to start scanning")
            }
            else if let peripheral = viewModel.peripheral {
                DeviceView(peripheral: peripheral)
                
            }
            else {
                Text("There are no connected devices")
            }
        
    }
        
        private func add() {
            devicesViewIsPresented = true
        }
    }
    

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Connecting()
    }
}
