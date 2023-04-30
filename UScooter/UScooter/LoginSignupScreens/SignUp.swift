//
//  SignUp.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct SignUp: View {
    @State private var fname: String = ""
    @State private var lname: String = ""
    @State private var user: String = ""
    @State private var password: String = ""
    @State private var conf_password: String = ""
    @State private var resulter: String = ""
    @State var valid: Bool = false
    
    @State private var showLogin: Bool = false // Add a state variable to control the presentation of the Login view

        var body: some View {
            VStack{
                if valid{
                    NavigationLink(destination: Login(), isActive: $showLogin) { // Use a navigation link to present the Login view
                        signUpScreen()
                    }
                    Text("Account Made").offset(y:-250).font(
                        .system(size: 20, weight:.medium))
                    .foregroundColor(.green)

            
                    Text("Redirecting you to Login Screen").offset(y: -250).font(
                        .system(size: 20, weight:.medium))
                    .foregroundColor(.green)
              
            
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                showLogin = true // Set the state variable to true to present the Login view
                            }
                        }}
            else{
                signUpScreen()
                    .padding()
                    .background(Scooter())
                    .navigationBarTitle("Sign Up", displayMode: .inline)
                    // Add gesture recognizer to dismiss keyboard when tapped outside of text fields
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }

            }
        }
    }
    
    private func pwordCheck(p1: String, p2: String) -> Bool{
        if (p1 != p2){
            return false
        }
        return true
    }
    
    private func fieldsCheck ()-> Bool{
        if (user == ""){
            return false
        }
        
        if (lname == ""){
            return false
        }
        
        if (fname == ""){
            return false
        }
        
        if (password == ""){
            return false
        }
        
        return true
    }
    
    private func validCheck(){
        if (fieldsCheck() && pwordCheck(p1: password, p2: conf_password)){
            valid = true
        }
    }
    
    private func signUpScreen() -> some View {
        VStack(spacing: 28) {
            InfoText().padding(.top, 44).offset(y:-50)
            
            TextField("First Name", text: $fname)
                .offset(y:-60)
                .padding()
            
            TextField("Last Name", text: $lname)
                .offset(y:-60)
                .padding()
            
            TextField("Username", text: $user)
                .offset(y:-60)
                .padding()
            
            SecureField("Password", text: $password)
                .offset(y:-60)
                .padding()
            
            SecureField("Confirm Password", text: $conf_password)
                .offset(y:-60)
                .padding()
            
            
            Button {
                debugPrint("Sign Up Button Tapped!")
                validCheck()
                if (valid == true) {
                    makeProfile(u: user, p: password, f: fname, l: lname)
                        
                    } else {
                        // Show an error message if validation fails
                        print("Something's not right, try again.")
                        resulter = "Something's not right, try again."
                    }
                         }label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .frame(width: 215, height: 44, alignment: .center)
            }


            
            .background(.green)
            .cornerRadius(4)
            .offset(y:-50)
            Text(resulter).offset(y: -150)
            Spacer()
        }
        .padding()
        .background(Scooter())
        .navigationBarTitle("Sign in", displayMode: .inline)
    }

}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
