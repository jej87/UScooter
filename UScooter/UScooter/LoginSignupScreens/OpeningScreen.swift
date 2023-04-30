//
//  OpeningScreen.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct OpeningScreen: View {
    var body: some View {
        VStack{
           
            HStack {
                Image("lock copy")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                Text ("- SCOOTER")
                    .font(
                        .system(size: 40, weight:.bold))
                    .foregroundColor(.orange)
                    .frame(maxHeight: .infinity,alignment: .bottom)
            }
         
            
        }
        

        .frame(width: 450, height:100)
        .offset(x: 0.0, y: -100.0)


    }
}

struct OpeningScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpeningScreen()
    }
}
