//
//  HomeImage.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/15/23.
//

import SwiftUI

struct HomeImage: View {
    var body: some View {
        VStack{
            Image("ScootBody")
                .resizable()
                .frame(width: 500, height: 200, alignment: .center)
                .offset(x:0, y:220)
            
            
        }
    }
       
}

struct HomeImage_Previews: PreviewProvider {
    static var previews: some View {
        HomeImage()
    }
}

