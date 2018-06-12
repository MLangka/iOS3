//
//  main.swift
//  iOS3-Langka
//
//  Created by Metawee Langka on 28.11.17.
//  Copyright © 2017 Metawee Langka. All rights reserved.
//

import Foundation

let path = "/Users/admin/Documents/iOS/iOS3-Langka/iOS3-Langka/book.plist"

var addressbook = AddressBook()

addressbook = AddressBook.addressBook(fromFile: path) ?? AddressBook()

func test(){
    if (addressbook.cards.count == 0){
        let card1 = AddressCard(firstname: "Peter",lastname: "Lemke",street: "Feldshof 2",zipcode: 10344,city: "Berlin")
        addressbook.add(card: card1)
        let card2 = AddressCard(firstname: "Laurine",lastname: "Zimmer",street: "Cäsarstraße 9A",zipcode: 10318,city: "Berlin")
        addressbook.add(card: card2)
        
        addressbook.cards[0].add(hobby: "Tanzen")
        addressbook.cards[0].add(hobby: "Malen")
        addressbook.cards[1].add(hobby: "Spazieren gehen")
        addressbook.cards[1].add(hobby: "Lesen")
        
        addressbook.sort()
        
    }
    addressbook.save(toFile: path)
}

func read(withPrompt: String)->String{
    print(withPrompt)
    let input = readLine()!
    return input
}


func commandInput(){
    //Read user input.
    var name = read(withPrompt: "(E)ingabe, (S)uche, (L)iste oder (Q)uit?")
    //Check if the input not q.
    while name != "q"{
        //Create a new card.
        if(name == "e"){
            let _firstname = read(withPrompt: "Neue Karte anlegen:\nVorname: ")
            let _lastname = read(withPrompt: "Nachname: ")
            let _street = read(withPrompt: "Straße: ")
            let _zipcodeString = read(withPrompt: "Potsleihzahl: ")
            let _zipcode = Int(_zipcodeString)
            let _city = read(withPrompt: "Ort: ")
            let newCard = AddressCard(firstname: _firstname, lastname: _lastname,street: _street, zipcode: _zipcode ?? 0000,city: _city)
            
            addressbook.add(card: newCard)
            
            var _hobby = read(withPrompt: "Hobbys: (Abbruch mit (Q)) ")
            while(_hobby != "q"){
                let curIndex = addressbook.cards.endIndex-1
                addressbook.cards[curIndex].add(hobby: _hobby)
                _hobby = read(withPrompt: "Hobbys: (Abbruch mit (Q)) ")
            }
            //
            name = _hobby
            //Sort the cards.
            addressbook.sort()
            
        }
        
        name = read(withPrompt: "(E)ingabe, (S)uche, (L)iste oder (Q)uit?")
        if(name == "l"){
            for i in 0...addressbook.cards.endIndex-1{
                print("+-----------------------------------\n| \(addressbook.cards[i].firstname) \(addressbook.cards[i].lastname)\n| \(addressbook.cards[i].street)\n| \(addressbook.cards[i].zipcode) \(addressbook.cards[i].city)\n| Hobbys:\n|  \(addressbook.cards[i].hobbys[i])\n| Friends:\n|  \(addressbook.cards[i].friends)\n+-----------------------------------\n")
            }
        }

        //Read a new command input.
        name = read(withPrompt: "(E)ingabe, (S)uche, (L)iste oder (Q)uit?")
        //Search for a card matching the lastname.
        if(name == "s"){
            var _search = read(withPrompt: "Suchname: ")
            let searchIndex = addressbook.search(lastname: _search)
            print("+-----------------------------------\n| \(addressbook.cards[searchIndex].firstname) \(addressbook.cards[searchIndex].lastname)\n| \(addressbook.cards[searchIndex].street)\n| \(addressbook.cards[searchIndex].zipcode) \(addressbook.cards[searchIndex].city)\n| Hobbys:\n|  \(addressbook.cards[searchIndex].hobbys[searchIndex])\n| Friends:\n|  \(addressbook.cards[searchIndex].friends)\n+-----------------------------------\n")
            _search = read(withPrompt: "(F)reund/in hinzufügen, (L)öschen oder (Z)urück?")
            if(_search == "f"){
                _search = read(withPrompt: "Name Freund/in: ")
                let friendIndex = addressbook.search(lastname: _search)
                addressbook.cards[searchIndex].add(friend: addressbook.cards[friendIndex])
                print("\(addressbook.cards[friendIndex].firstname) \(addressbook.cards[friendIndex].lastname) hinzugefügt.")
            }
            _search = read(withPrompt: "(F)reund/in hinzufügen, (L)öschen oder (Z)urück?")
            if(_search == "l"){
                _search = read(withPrompt: "Name Löschen: ")
                let friendIndex = addressbook.search(lastname: _search)
                addressbook.cards[searchIndex].remove(friend: addressbook.cards[friendIndex])
                print("\(addressbook.cards[friendIndex].firstname) \(addressbook.cards[friendIndex].lastname) gelöscht.")
            }
            _search = read(withPrompt: "(F)reund/in hinzufügen, (L)öschen oder (Z)urück?")
            if(_search == "z"){
                name = read(withPrompt: "(E)ingabe, (S)uche, (L)iste oder (Q)uit?")
            }
        }
        
        print("Programm Ended")
        
    }
}


test()
commandInput()
addressbook.save(toFile: path)


