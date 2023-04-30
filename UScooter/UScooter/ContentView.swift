//
//  ContentView.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Login_SignUp()) {
                OpeningScreen().frame(width:1000, height: 1000)
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
