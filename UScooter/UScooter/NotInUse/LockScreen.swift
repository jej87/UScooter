//
//  LockScreen.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

//let myBluetoothInstance = Bluetooth();
struct LockScreen: View {
   
    
    //init() {
      //  setupNavigationBarAppearance(titleColor: UIColor.white, barColor: UIColor(.green))
            
    //}
   
    var body: some View {
      
                VStack(spacing: 28) {
                    InfoText().padding(.top, 44)
                        .offset(y:-150)
                    
                    Button {
                        debugPrint("Lock Button Tapped!")
                    } label: {
                        NavigationLink(destination:ConfirmLock()) {
                            Text("Lock")
                                .foregroundColor(.green)
                                .font(.system(size: 40))
                                .frame(width: 215, height: 90, alignment: .center)
                            
                        }
                    }
    
                    .buttonStyle(.bordered)
                    .background()
                    .cornerRadius(10)
                    .offset(y: -70)
                    
                    Button {
                        debugPrint("Unlock Button Tapped!")
                    } label: {
                        NavigationLink(destination: ConfirmUnlock()) {
                            Text("Unlock")
                                .foregroundColor(.green)
                                .font(.system(size: 40))
                                .frame(width: 215, height: 90, alignment: .center)
                        }
                    }
                    .buttonStyle(.bordered)
                    .background()
                    .cornerRadius(10)
                    .offset(y: -70)
                  
                    
                }
            .padding()
            .background()
          
        }
        
        
    
}

struct LockScreen_Previews: PreviewProvider {
    static var previews: some View {
        LockScreen()
    }
}

