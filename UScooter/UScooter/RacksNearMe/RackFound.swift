//
//  RackFound.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/23/23.
//

import SwiftUI

struct RackFound: View {
    private func myRackConnectionn()-> String{
        if Rack.con == true{
            return "Rack 1 is Nearby"
        }
        else{
            return "No Rack Connections Found"
        }
    }
    
    var body: some View {
        VStack{
            Image("ES4").resizable().frame(width:150, height:200)
            Text(myRackConnectionn()).font(
                .system(size: 20, weight:.bold))
            .foregroundColor(.black)
        }
        
    }
}

struct RackFound_Previews: PreviewProvider {
    static var previews: some View {
        RackFound()
    }
}
