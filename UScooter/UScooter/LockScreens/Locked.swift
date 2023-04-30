//
//  Locked.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI


struct Locked: View {
    @State private var locking: Bool = false
    var body: some View {
        if locking{
            ConfirmLock()
            
        }
        else{
            lockThisScreen()
        }
    }
    private func lockThisScreen() -> some View{
            VStack{
                Image("lock")
                    .resizable()
                    .frame(width: 100, height: 150)
                
                Text ("Locking...")
                    .font(
                        .system(size: 30, weight:.bold))
                    .foregroundColor(.orange)
                    .offset(y: 10)
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 30.0){
                    locking = true
                }
            }
    }
}

struct Locked_Previews: PreviewProvider {
    static var previews: some View {
        Locked()
    }
}
