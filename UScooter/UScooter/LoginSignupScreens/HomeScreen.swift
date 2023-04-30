//
//  HomeScreen.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct Scoot: View{
    var body: some View{
        Image("Scooter")
            .resizable()
            .frame(width: 100, height: 125)
    }
}


struct HomeScreen: View {
    
    var body: some View {
        
    
                VStack(spacing: 28) {
                    InfoText().padding(.top, 44)
                        .offset(y:-150)
                    Button {
                        debugPrint("Find Racks Near Me Button Tapped!")
                    } label: {
                        NavigationLink(destination: RackNearMe()) {
                            Text("Find Racks Near Me")
                                .foregroundColor(.green)
                                .font(.system(size: 25))
                                .frame(width: 300, height: 44, alignment: .center)
                            
                        }
                    }
                    .buttonStyle(.bordered)
                    .background(.white)
                    .cornerRadius(4)
                    .offset(y: -120)
                    
                    Button {
                        debugPrint("My Scooter Button Tapped!")
                    } label: {
                        NavigationLink(destination:Connecting()) {
                            Text("My Scooter")
                                .foregroundColor(.green)
                                .font(.system(size: 25))
                                .frame(width: 300, height: 44, alignment: .center)
                            
                        }
                    }
                    .buttonStyle(.bordered)
                    .background(.white)
                    .cornerRadius(4)
                    .offset(y: -100)
                    
                    Button {
                        debugPrint("My Profile Button Tapped!")
                    } label: {
                        NavigationLink(destination: ViewProfile()) {
                            Text("My Profile")
                                .foregroundColor(.green)
                                .font(.system(size: 25))
                                .frame(width: 300, height: 44, alignment: .center)
                            
                        }
                    }
                    .buttonStyle(.bordered)
                    .background(.white)
                    .cornerRadius(4)
                    .offset(y:-80)
                    
                }
            .padding()
            .background(HomeImage())
            .navigationBarTitle("Home", displayMode: .inline)
    
        }
        
        
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
