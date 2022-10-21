//
//  SeriesController.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 30/10/21.
//

import Foundation
import CryptoKit
import Alamofire

class SeriesController {
    
    var seriesArray: [Series] = []
    
    
    let ts = String(Date().timeIntervalSince1970)
    let publicKey = "946bde9598d058491f7b93cbbdde0f20"
    let privateKey = "8513c2f9c9f95b197b0f186e996ed8aa2cddca11"
    let characterId = ""
    
    func getCount() -> Int{
        return seriesArray.count
    }
    
    func getCharacter(indexPath: IndexPath) -> Series{
        return self.seriesArray[indexPath.row]
    }
    
    
    func getSeries(title: String?, completion: @escaping (Bool, Error?) -> Void) {
        
        var url: String = ""
        let hash = self.MD5(data: "\(ts)\(privateKey)\(publicKey)")
        if title != nil {
            let nameCharacter: String = title ?? ""
            print(nameCharacter)
            url = "https://gateway.marvel.com:443/v1/public/series?titleStartsWith=\(nameCharacter)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        }else{
            url = "https://gateway.marvel.com:443/v1/public/series?limit=100&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        }
        print("============\(url)")
        AF.request(url).responseJSON{
            response in
            if let data = response.data {
                do{
                    let result: SeriesAPIResult = try JSONDecoder().decode(SeriesAPIResult.self, from: data)
                    self.seriesArray = result.data.results
                    completion(true, nil)
                }catch{
                    completion(false, error)
                }
            }
        }
    }
    func MD5(data: String) ->String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map{String(format: "%002hx", $0)
            
        }
        .joined()
    }
}
