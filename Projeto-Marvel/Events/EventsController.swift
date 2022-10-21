//
//  EventsController.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 29/11/21.
//

import Foundation
import CryptoKit
import Alamofire

class EventsController {
    
    var eventsArray: [Events] = []
    
    let ts = String(Date().timeIntervalSince1970)
    private let privateKey = "8513c2f9c9f95b197b0f186e996ed8aa2cddca11"
    let publicKey = "946bde9598d058491f7b93cbbdde0f20"
    
    
    func getCount() -> Int{
        return eventsArray.count
    }
    
    func getCharacter(indexPath: IndexPath) -> Events{
        return self.eventsArray[indexPath.row]
    }
    
    func getEvents(title: String?, completion: @escaping (Bool, Error?) -> Void ){
        
        var url: String = ""
        let hash = self.MD5(data: "\(ts)\(privateKey)\(publicKey)")
        if title != nil {
            let nameTitle: String = title ?? ""
            url = "https://gateway.marvel.com:443/v1/public/events?nameStartsWith=\(nameTitle)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        } else {
            url = "https://gateway.marvel.com:443/v1/public/events?limit=100&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        }
        print("=============\(url)===========")
        AF.request(url).responseJSON { response in
            if let data = response.data {
                do{
                    let result: Welcome = try JSONDecoder().decode(Welcome.self, from: data)
                    self.eventsArray = result.data.results
                    completion(true, nil)
                } catch {
                    completion(false, error)
                }
            }
        }
        
        
        
        
    }
    
    func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map{ String (format: "%002hx", $0)
            
        }
        .joined()
    }
    
}
