//
//  NetworkManager.swift
//  journal
//
//  Created by Allen Wu on 12/2/22.
//

import UIKit
import Alamofire


class NetworkManager {
    
    static var auth = "Bearer "

    static let host = "http://34.150.206.225"

    static func getAll(completion: @escaping (Journals) -> Void) {
        let endpoint = "\(host)/api/entries/"
        
        let header: HTTPHeaders = [.authorization(bearerToken: auth)]
        
        AF.request(endpoint, method: .get, headers: header).validate().responseData { response in
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


    static func create(title: String, content: String, emotion: String, completion: @escaping (Journal) -> Void) {
        let endpoint = "\(host)/api/entries/"
        let params = [
            "title": title,
            "content": content,
            "emotion": emotion
        ]
        
        let header: HTTPHeaders = [.authorization(bearerToken: auth)]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).validate().responseData {
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
        let endpoint = "\(host)/api/entries/\(id)/"
        
        let header: HTTPHeaders = [.authorization(bearerToken: auth)]
        AF.request(endpoint, method: .delete, headers: header).validate().responseData {
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
    
    static func update(journal: Journal, completion: @escaping (Journal) -> Void) {
        let endpoint = "\(host)/api/entries/\(journal.id)/"
        let header: HTTPHeaders = [.authorization(bearerToken: auth)]
        let params = [
            "title": journal.title,
            "content": journal.content,
            "emotion": journal.emotion
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).validate().responseData {
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
    
    static func login(username: String, password: String, completion: @escaping (User) -> Void) {
        let endpoint = "\(host)/login/"
        let params = [
            "email": username,
            "password": password,
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {
            response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    
                    if let userResponse = try? jsonDecoder.decode(User.self, from: data) {
                        completion(userResponse)
                    } else {
                        print("Failed to decode update")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    static func register(username: String, password: String, completion: @escaping (User) -> Void) {
        let endpoint = "\(host)/register/"
        let params = [
            "email": username,
            "password": password,
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {
            response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    
                    if let userResponse = try? jsonDecoder.decode(User.self, from: data) {
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

