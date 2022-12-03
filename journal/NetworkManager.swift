//
//  NetworkManager.swift
//  journal
//
//  Created by Allen Wu on 12/2/22.
//

import UIKit
import Alamofire


class NetworkManager {

    static let host = ""

    static func getAll(completion: @escaping (Journals) -> Void) {
        let endpoint = "\(host)/api/entries"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userResponse = try? jsonDecoder.decode(Journals.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllPosts")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


    static func create(body: String, completion: @escaping (Journal) -> Void) {
        let endpoint = "\(host)/tasks/"
        let params = [
            "description": body
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {
            response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    
                    if let userResponse = try? jsonDecoder.decode(Journal.self, from: data) {
                        completion(userResponse)
                    } else {
                        print("Failed to decode post")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    static func delete(id: String, completion: @escaping (Journal) -> Void) {
        let endpoint = "\(host)/tasks/\(id)/"
        AF.request(endpoint, method: .delete).validate().responseData {
            response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    
                    if let userResponse = try? jsonDecoder.decode(Journal.self, from: data) {
                        completion(userResponse)
                    } else {
                        print("Failed to decode delete")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    static func update(id: String, body: String, completion: @escaping (Journal) -> Void) {
        let endpoint = "\(host)/tasks/\(id)/"
        let params = [
            "description": body,
            "done": true
        ] as [String : Any]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {
            response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    
                    if let userResponse = try? jsonDecoder.decode(Journal.self, from: data) {
                        completion(userResponse)
                    } else {
                        print("Failed to decode update")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    static func login(id: String, body: String, completion: @escaping (Journal) -> Void) {
        let endpoint = "\(host)/tasks/\(id)/"
        let params = [
            "description": body,
            "done": true
        ] as [String : Any]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {
            response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    
                    if let userResponse = try? jsonDecoder.decode(Journal.self, from: data) {
                        completion(userResponse)
                    } else {
                        print("Failed to decode update")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

