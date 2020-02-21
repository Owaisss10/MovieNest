//
//  GenreResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 21, 2020

import Foundation


class GenreResponse : NSObject, NSCoding{

    var genres : [Genre]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        genres = [Genre]()
        if let genresArray = dictionary["genres"] as? [[String:Any]]{
            for dic in genresArray{
                let value = Genre(fromDictionary: dic)
                genres.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if genres != nil{
            var dictionaryElements = [[String:Any]]()
            for genresElement in genres {
                dictionaryElements.append(genresElement.toDictionary())
            }
            dictionary["genres"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        genres = aDecoder.decodeObject(forKey: "genres") as? [Genre]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if genres != nil{
            aCoder.encode(genres, forKey: "genres")
        }
    }
}