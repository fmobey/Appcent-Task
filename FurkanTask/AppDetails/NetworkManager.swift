//
//  NetworkManager.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import Foundation


final class NetworkManager {
    
    init() { }
    
    func getData<T>(url: String, completion: @escaping (T?) -> Void) where T: Codable {
        let preparedURL = URL(string: url)
        let sessionConfiguration = URLSessionConfiguration.default
//        sessionConfiguration.httpAdditionalHeaders = ["User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3"]
        let session = URLSession(configuration: sessionConfiguration)
        
        //URLSession.shared.configuration.httpAdditionalHeaders
        let task = session.dataTask(with: preparedURL!) { (data, res, error) in
            if error == nil {
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let responseObject = try JSONDecoder().decode(T.self, from: data)
                            completion(responseObject)
                        }catch{
                            print("Data Boş", error)
                            completion(nil)
                        }
                    }
                    
                }
            }
        }
        task.resume()
    }
    
    func postData<T, K>(url: String, params: K, completion: @escaping (T?) -> Void) where T: Codable, K: Encodable {
        
    }
}
