//
//  Scooter.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct Scooter: View {
    var body: some View {
        VStack{
            Image("ElectricScooter")
                .resizable()
                .frame(width: 350, height: 500, alignment: .center)
                .offset(y:50)
        }
    }
       
}

struct Scooter_Previews: PreviewProvider {
    static var previews: some View {
        Scooter()
    }
}
