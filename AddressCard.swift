//
//  AddressCard.swift
//  iOS3-Langka
//
//  Created by Metawee Langka on 28.11.17.
//  Copyright © 2017 Metawee Langka. All rights reserved.
//

import Foundation

class AddressCard: Codable, Equatable {
    
    var firstname = ""
    var lastname = ""
    var street = ""
    var zipcode = 0
    var city = ""
    var hobbys = [String]()
    var friends = [AddressCard]()
    
    init(firstname: String, lastname: String, street: String, zipcode: Int, city: String)
    {
        self.firstname = firstname
        self.lastname = lastname
        self.street = street
        self.zipcode = zipcode
        self.city = city
    }
    
    static func ==(lhs: AddressCard, rhs: AddressCard) -> Bool {
        return lhs.firstname == rhs.lastname
    }
    
    func add(hobby: String){
        hobbys.append(hobby)
    }
    
    func remove(hobby: String){
        hobbys.remove(at: hobbys.index(of: hobby)!)
    }
    
    func add(friend: AddressCard){
        friends.append(friend)
    }
    
    func remove(friend: AddressCard){
        friends.remove(at: friends.index(of: friend)!)
    }
}
