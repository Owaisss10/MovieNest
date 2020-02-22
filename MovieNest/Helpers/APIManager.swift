//
//  APIManager.swift
//  MovieNest
//
//  Created by Awais Akram on 21/02/2020.
//  Copyright © 2020 Awais Akram. All rights reserved.
//

import Foundation
import Alamofire
import SCLAlertView


public class APIManager {
    
    // MARK: - 1.0 fetchAllGenreIDS API
    
    public static func getAllGenreIDS(completionHandler: @escaping (Any?, Error?) -> ()) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url:URL = URL(string: "\(Constants.serverURL)\(Constants.allGenres)api_key=\(Constants.API_KEY)&language=\(Constants.LANGUAGE)")!
        
        print("getAllGenreIDS URL: \(url)")
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                print("getAllGenreIDS Response")
                print(response)
                switch response.result {
                case .success(let value):
                    DispatchQueue.main.async(execute: {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    })
                    completionHandler(value as? NSDictionary, nil)
                case .failure(let error):
                    print("getAllGenreIDS Err: \(error)")
                    DispatchQueue.main.async(execute: {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    })
                    completionHandler(nil, error)
                }
        }
    }
    
    // MARK: - 2.0 fetchAllGenreIDS API
    
    public static func getMoviesList(genreID: String, completionHandler: @escaping (Any?, Error?) -> ()) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url:URL = URL(string: "\(Constants.serverURL)\(Constants.discover)api_key=\(Constants.API_KEY)&with_genres=\(genreID)&language=\(Constants.LANGUAGE)")!
        
        print("getMoviesList URL: \(url)")
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                print("getMoviesList Response")
                print(response)
                switch response.result {
                case .success(let value):
                    DispatchQueue.main.async(execute: {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    })
                    completionHandler(value as? NSDictionary, nil)
                case .failure(let error):
                    print("getMoviesList Err: \(error)")
                    DispatchQueue.main.async(execute: {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    })
                    completionHandler(nil, error)
                }
        }
    }
    
}
