//
//  RackNearMe.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct RackNearMe: View {
    @State private var scooterOffset = CGSize.zero
    @State private var nearby: Bool = false
    var body: some View {
        if nearby{
            RackFound()
            
        }
        else{
            rackNearby()
        }
    }
    
   
    private func rackNearby() -> some View{
        VStack {
            Image("ElectricScooter (1)")
                .resizable()
                .frame(width:100, height: 120)
                .offset(scooterOffset)
                .animation(.easeInOut(duration: 1.0).repeatForever(), value: scooterOffset)
            
            Image("earth")
                .resizable()
                .frame(width: 300, height: 300, alignment: .center).offset(y: 0)
            
            Text("Searching for Racks Near You...")
                .font(.system(size: 20, weight:.medium))
                .foregroundColor(.black)
                .offset(y: -550)
        }
        
        .onAppear {
            self.scooterOffset = CGSize(width: 0, height: 5)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
                        nearby = true
                    }
                
        }.offset(y:50)
    }
}



struct RackNearMe_Previews: PreviewProvider {
    static var previews: some View {
        RackNearMe()
    }
}
