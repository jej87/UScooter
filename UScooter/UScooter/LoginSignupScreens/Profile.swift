//
//  Profile.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/22/23.
//

import Foundation

struct Profile {
      var user = ""
     var pword = ""
     var fname = ""
     var lname = ""
    var rack = ""
}

struct Rack{
 static var RACK = ""
 static var con  = false
}

func printRack()->String{
    return Rack.RACK
}
struct Book{
    static var myBook : [Profile] = []
    static var count = 0
   
}

func initialize(){
    let homeProfile = Profile(user: "jej87", pword: "pass", fname: "Justine", lname:"Joseph")
    Book.myBook.append(homeProfile)
}

func makeProfile(u: String, p: String, f: String, l: String){
    let thisProfile = Profile(user: u, pword: p, fname: f, lname:l)
    Book.myBook.append(thisProfile)
}


func findProfile(u: String, p: String)->String{
    for profile in Book.myBook {
        if profile.user == u && profile.pword == p {
            return profile.user
        }
    }
    return "Not found" // return nil if no match is found
}

func returnProfile(u: String)->Profile{
    for profile in Book.myBook {
        if profile.user == u {
            return profile
        }
    }
    let emptyProf = Profile(user: "Not Found", pword: "", fname: "", lname:"")
    return emptyProf
}

func validateAdmin(u: String, p: String)->Bool{
    for profile in Book.myBook {
        if profile.user == u && profile.pword == p {
            return true
        }}
    return false
}
    
func returnBook()->[Profile]{

    return Book.myBook // return nil if no match is found
}

