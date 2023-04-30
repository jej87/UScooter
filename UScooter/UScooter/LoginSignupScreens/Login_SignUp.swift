//
//  Login_SignUp.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import SwiftUI

struct Login_SignUp: View {
 
    var body: some View {
    
            VStack{
                
                    Button {
                        debugPrint("Login Button Tapped!")
                       
                    } label: {
                    NavigationLink(destination: Login()) {
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 215, height: 44, alignment: .center)
                    }}
                    .background(.green)
                    .cornerRadius(4)
                    .offset(y: 30)
                
                
      
                    Button {
                        debugPrint("Sign Up Button Tapped!")
                    } label: {
                        NavigationLink(destination: SignUp()) {
                        Text("New Member? - Sign Up")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 215, height: 44, alignment: .center)
                    }
                    .background(.green)
                    .cornerRadius(4)
                    .padding(.top, 36)
                    .offset(y: 30)
                }
                
                
                
                
                OpeningScreen()
                    .offset(y: -200)
                
            }
            .background(HomeScooter())
           

        }
        
        
    
}

struct Login_SignUp_Previews: PreviewProvider {
    static var previews: some View {
        Login_SignUp()
    }
}
