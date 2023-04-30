//
//  Unlocked.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct Unlocked: View {
    @State var un: Bool = false
    var body: some View {
        if un{
            ConfirmUnlock()
        }
        else{
            unlockScreen()
        }
    }
        
        private func unlockScreen() -> some View{
            VStack{
                Image("unlocking")
                    .resizable()
                    .frame(width: 100, height: 150)
                
                Text ("Unlocking...")
                    .font(
                        .system(size: 30, weight:.bold))
                    .foregroundColor(.orange)
                    .offset(y: 10)
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 30.0){
                    un = true
                }
            }
           
        
       
    }
}

struct Unlocked_Previews: PreviewProvider {
    static var previews: some View {
        Unlocked()
    }
}
