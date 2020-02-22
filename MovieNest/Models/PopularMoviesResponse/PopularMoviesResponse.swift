//
//  PopularMoviesResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 22, 2020

import Foundation


class PopularMoviesResponse : NSObject, NSCoding{

    var page : Int!
    var results : [PopularMoviesResult]!
    var totalPages : Int!
    var totalResults : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        page = dictionary["page"] as? Int
        totalPages = dictionary["total_pages"] as? Int
        totalResults = dictionary["total_results"] as? Int
        results = [PopularMoviesResult]()
        if let resultsArray = dictionary["results"] as? [[String:Any]]{
            for dic in resultsArray{
                let value = PopularMoviesResult(fromDictionary: dic)
                results.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if page != nil{
            dictionary["page"] = page
        }
        if totalPages != nil{
            dictionary["total_pages"] = totalPages
        }
        if totalResults != nil{
            dictionary["total_results"] = totalResults
        }
        if results != nil{
            var dictionaryElements = [[String:Any]]()
            for resultsElement in results {
                dictionaryElements.append(resultsElement.toDictionary())
            }
            dictionary["results"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        page = aDecoder.decodeObject(forKey: "page") as? Int
        results = aDecoder.decodeObject(forKey: "results") as? [PopularMoviesResult]
        totalPages = aDecoder.decodeObject(forKey: "total_pages") as? Int
        totalResults = aDecoder.decodeObject(forKey: "total_results") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if page != nil{
            aCoder.encode(page, forKey: "page")
        }
        if results != nil{
            aCoder.encode(results, forKey: "results")
        }
        if totalPages != nil{
            aCoder.encode(totalPages, forKey: "total_pages")
        }
        if totalResults != nil{
            aCoder.encode(totalResults, forKey: "total_results")
        }
    }
}
