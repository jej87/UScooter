//
//  LockScooter.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct LockScooter: View {
    var body: some View {
        VStack{
            Image("ElectricScooter (1)")
                .resizable()
                .frame(width: 350, height: 400, alignment: .bottom)
                .opacity(0.9)
                .offset(y:180)
            
        }
    }
}

struct LockScooter_Previews: PreviewProvider {
    static var previews: some View {
        LockScooter()
    }
}
