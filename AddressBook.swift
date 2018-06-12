//
//  AddressBook.swift
//  iOS3-Langka
//
//  Created by Metawee Langka on 28.11.17.
//  Copyright © 2017 Metawee Langka. All rights reserved.
//

import Foundation

class AddressBook: Codable {
    
    var cards = [AddressCard]()
    
    func add(card: AddressCard){
        cards.append(card)
    }
    
    func remove(card: AddressCard){
        if let index = cards.index(of: card){
            for element in cards {
                if (element.friends.index(of: card) != nil) {
                    element.remove(friend: card)
                }
            }
            cards.remove(at: index)
        }
    }
    
    func sort(){
        cards.sort(by:{$0.lastname < $1.lastname})
    }
    
    func search(lastname: String) -> Int{
        var index = 0
        for element in cards {
            if let _index = cards.index(of: element){
                if(element.lastname == lastname){
                    index = _index
                }
            }
        }
        return index
    }
    
    func save(toFile path: String){
        let url = URL(fileURLWithPath: path)
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(cards){
            try? data.write(to: url)
        }
    }
    
    class func addressBook(fromFile path: String) -> AddressBook?{
        var book = AddressBook()
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url){
            let decoder = PropertyListDecoder()
            if let _book = try? decoder.decode(self, from: data){
                book = _book
            }
        }
        return book
    }

}

