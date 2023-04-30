//
//  ViewProfile.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct ViewProfile: View {
    
    @State private var fname: String = ""
    @State private var lname: String = ""
    @State private var uname: String = ""
   

    var body: some View {
        VStack{
            InfoText().offset(x:0, y: -200)
                .onAppear{
                    let prof = returnProfile(u:myProfile.uname)
                    fname = prof.fname
                    lname = prof.lname
                    uname = prof.user
                }
            ProfileScreen()
          
            
            
        }
        
    }
    
    private func myRackConnection()-> String{
        if Rack.con == true{
            return "You are connected to Rack 1"
        }
        else{
            return "No Rack Connections Found"
        }
    }
    
    
    //Viewbuilder
    private func ProfileScreen() -> some View {
        VStack {
            HStack{
                Text(fname)
                Text(lname)
            }.offset(y: -100)
                .font(
                    .system(size: 40, weight:.bold))
                .foregroundColor(.orange)
                
            //Text(printRack())
            Text(uname).font(
                .system(size: 20, weight:.bold))
            .foregroundColor(.orange).offset(y: -70)
            Text(myRackConnection()).font(
                .system(size: 20, weight:.bold))
            .foregroundColor(.black)
                }
            
    }
        
        
    
}


    struct ViewProfile_Previews: PreviewProvider {
        static var previews: some View {
            ViewProfile()
        }
    }



