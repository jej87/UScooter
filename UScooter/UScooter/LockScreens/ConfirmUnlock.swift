//
//  ConfirmUnlock.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/17/23.
//

import SwiftUI

struct ConfirmUnlock: View {
    @State private var ulockingg: Bool = false
    var body: some View {
        if ulockingg{
            HomeScreen()
            
        }
        else{
            confUnlockScreen()
        }
    }
    private func confUnlockScreen() -> some View{
        VStack{
            Image("ES4").resizable().frame(width:300, height:350)
            Text("Unlocked").font(
                .system(size: 30, weight:.bold))
            .foregroundColor(.orange)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                ulockingg = true
            }
        }
    }
}

struct ConfirmUnlock_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmUnlock()
    }
}
