//
//  dataHandler.swift
//  lab4-extra-credit
//
//  Created by Jess Ryan on 4/30/22.
//

import Foundation

class DataHandler{
    var allData = [Book]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([Book].self, from: data)
            } catch {
                // handle error
                print(error)
            }
        }
    }
    
    func getBooks() -> [String]{
        var books = [String]()
        for book in allData{
            books.append(book.name)
        }
        return books
    }
    
    func getURL(index:Int) -> String {
        return allData[index].url
    }
}
