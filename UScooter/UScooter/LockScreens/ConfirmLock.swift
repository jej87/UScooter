//
//  ConfirmLock.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/17/23.
//

import SwiftUI

struct ConfirmLock: View {
    @State private var lockingg: Bool = false
    var body: some View {
        if lockingg{
            HomeScreen()
            
        }
        else{
            confLockScreen()
        }
    }
    private func confLockScreen() -> some View{
        VStack{
            Image("ES4").resizable().frame(width:300, height:350)
            Text("Locked").font(
                .system(size: 30, weight:.bold))
            .foregroundColor(.orange)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                lockingg = true
            }
        }
    }
}

struct ConfirmLock_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmLock()
    }
}
