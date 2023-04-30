//
//  DeviceView.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/17/23.
//

import SwiftUI
import CoreBluetooth

struct DeviceView: View {
    
    @StateObject public var viewModel: DeviceViewModel
    @State private var modeSelectionIsPresented = false
    @State private var didAppear = false
    @State private var lock: Bool = false
    @State private var unlock: Bool = false
    
    //MARK: - Lifecycle
    
    init(peripheral: CBPeripheral) {
        let viewModel = DeviceViewModel(peripheral: peripheral)
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    
    var body: some View {
        VStack{
           if lock{
                Locked()
            }
            else if unlock{
                Unlocked()
            }
            else{
                content()
                    .onAppear {
                        viewModel.connect()
                    }
            }
        }
    }
    
    @ViewBuilder
    private func content() -> some View {
            VStack {
                InfoText().padding(.top, 44)
                    .offset(y:-150)
                
                Button {
                    debugPrint("Lock Button Tapped!")
                    viewModel.write("1")
                    Rack.con = true
                    lock = true
                } label: {
                 
                        Text("Lock")
                            .foregroundColor(.green)
                            .font(.system(size: 40))
                            .frame(width: 215, height: 90, alignment: .center)
                        
                    
                }
                .buttonStyle(.bordered)
                .background()
                .cornerRadius(10)
                .offset(y: -70)
                
                Button {
                    debugPrint("Unlock Button Tapped!")
                    viewModel.write("2")
                    unlock = true
                    Rack.con = true
                } label: {
                   
                        Text("Unlock")
                            .foregroundColor(.green)
                            .font(.system(size: 40))
                            .frame(width: 215, height: 90, alignment: .center)
                    
                }
                .buttonStyle(.bordered)
                .background()
                .cornerRadius(10)
                .offset(y: -40)
                
                
            }
            
            //.padding()
            //.background()
            
        }
        
    }
    

