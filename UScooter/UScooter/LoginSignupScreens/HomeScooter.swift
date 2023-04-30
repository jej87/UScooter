//
//  HomeScooter.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct HomeScooter: View {
    var body: some View {

            Image("ElectricScooter 1")
                .resizable()
                .frame(width: 400, height: 260, alignment: .bottom)
                .opacity(0.9)
                .offset(x:10, y:250)
        
         
      
        
    }
       
}

struct HomeScooter_Previews: PreviewProvider {
    static var previews: some View {
        HomeScooter()
    }
}
