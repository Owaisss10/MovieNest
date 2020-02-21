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
    
    // MARK: - 1.0 Login API
    
    
    
//    public static func fetchAllGenreIDS(completionHandler: @escaping ([Any], Error?) -> ()) {
//
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//
//        var urlString = ""
//
//        // 1. Creating stringJSON of request_type
//        let json:[String: Any] = [
//            "request_type": "tsp"
//        ]
//        guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) else {
//            return
//        }
//        let jsonString = String(data: jsonData, encoding: .utf8)!
//
//        // 2. Creating stringJSON of points
//        guard let pointsData = try? JSONSerialization.data(withJSONObject: points, options: []) else {
//            return
//        }
//        var pointsString = String(data: pointsData, encoding: .utf8)!
//
//
//            // 3. Concatenate them with the URL
//        urlString = "\(Constant.pointsURL)param=\(jsonString.dropLast()),\(pointsString.dropFirst())"
//
//        // =======================
//
//        print("fetchAllGenreIDS URL when fix_start = \(isFixedStart) \t: \(urlString)")
//
//
//        // 4. Do URL Encoding because Alamofire throws InValid URL response error
//        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded) {
//
//            Alamofire.request(url, method: .get, encoding: JSONEncoding.prettyPrinted)
//                .validate().responseJSON { response in
//
//
//                    var data = [TSPResponse]()
//                    if let status = response.response?.statusCode {
//
//                        DispatchQueue.main.async(execute: {
//                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//                        })
//
//                        switch(status){
//                        case 200: //success
//                            //to get JSON return value
//                            if let result = response.result.value {
//                                if Constant.IS_DEBUG {
//                                    print(response.result.value)
//                                }
//
//
//                                let jArray = result as! NSArray
//                                //                                for (index, item) in jArray.enumerated() {
//                                //                                    let a = TSPResponse(fromDictionary: item as! [String : Any])
//                                //                                    a.index = index
//                                //                                    data.append(a)
//                                //                                }
//
//                                completionHandler(jArray as! [Any], nil)
//                            }
//                        case 401: //session expired
//
//                            print("401")
//                            //                            self.sclErrorAlert(message: "The session has expired", titleMsg: "An error occurred - 401 !")
//                            let error = response.result.error
//                            completionHandler(data, error)
//                        default:
//                            print("default")
//                            //                            self.sclErrorAlert(message: "Something went wrong. Please try again.", titleMsg: "An error occurred - 401 !")
//                            let error = response.result.error
//                            completionHandler(data, error)
//                        }
//                    }
//                    else {
//                        print("An error occurred !")
//                        //                        self.sclErrorAlert(message: (response.error?.localizedDescription)!, titleMsg: "An error occurred !")
//                        let error = response.result.error
//                        completionHandler(data, error)
//                    }
//
//            }
//        }
//
//    }
 
    
    public static func fetchAllGenreIDS(completionHandler: @escaping (Any?, Error?) -> ()) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url:URL = URL(string: "\(Constants.serverURL)\(Constants.allGenres)api_key=\(Constants.API_KEY)&language=\(Constants.LANGUAGE)")!
        
        print("fetchAllGenreIDS URL: \(url)")
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                print("fetchAllGenreIDS Response")
                print(response)
                switch response.result {
                case .success(let value):
                    DispatchQueue.main.async(execute: {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    })
                    completionHandler(value as? NSDictionary, nil)
                case .failure(let error):
                    print("fetchAllGenreIDS Err: \(error)")
                    DispatchQueue.main.async(execute: {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    })
                    completionHandler(nil, error)
                }
        }
    }
}
