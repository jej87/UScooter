//
//  ContentView.swift
//  Login
//
//  Created by Isabela Bandrich
//  Edited by Justine Joseph.
//

import SwiftUI


struct InfoText: View {
    var body: some View {
        Image("lock copy")
            .resizable()
            .frame(width:65, height:100)
    }
}

struct TextFieldName: View {
    let name: String
    var body: some View {
        Text(name)
            .font(.system(size: 13, weight: .light))
            .foregroundColor(.secondary)
            .frame(height: 15, alignment: .leading)
    }
}

struct myProfile{
    static var uname = ""
}

struct Login: View {
    //@StateObject var thisProfile = myProfile()
    @State public var username = ""
    @State private var password = ""
    @State private var resulter = ""
    @State var loggedIn: Bool = false
    
    var body: some View {
        VStack{
            if loggedIn{
                HomeScreen()
            }
            else{
                logInScreen()
                    .padding()
                    .background(Scooter())
                    .navigationBarTitle("Log in", displayMode: .inline)
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)}
        
    }
        
//Viewbuilder
private func logInScreen() -> some View {
        VStack {
            InfoText().padding(.top, 44).offset(y:-150).onAppear{
                initialize()
            }
            TextField("User Name", text: $username)
                .offset(y:-100)
                .padding()
            SecureField("Password", text: $password)
                .padding()
                .offset(y:-80)
            
          
            Button{
                if (username == "" || password == ""){
                    resulter = "Login Failed - Missing User or Password"
                    return
                }
                if (findProfile(u: username, p: password) != "Not found") {
                    print("Login successful")
                    resulter = "Login Successful"
                    self.loggedIn = true
                    myProfile.uname = findProfile(u: username, p: password)
                    // Code to navigate to the next screen
                    return
                }
                else{
                    print("Login failed")
                    resulter = "Login Failed - Wrong User or Password"
                    }
                    
            }label: {
                
                Text("Log in")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .frame(width: 215, height: 44, alignment: .center)
                } .background(.green)
                .cornerRadius(4)
                .offset(y:-50)
                .padding(.top, 36)
                
            Text("\(resulter)")
        }
    
    
    }
    
}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}



