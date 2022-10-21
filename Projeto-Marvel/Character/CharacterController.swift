//
//  CharacterController.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 27/10/21.
//

import Foundation
import CryptoKit
import Alamofire

class CharacterController {
    
    var characterArray: [Character] = []
    
    let ts = String(Date().timeIntervalSince1970)
    let publicKey = "946bde9598d058491f7b93cbbdde0f20"
    let privateKey = "8513c2f9c9f95b197b0f186e996ed8aa2cddca11"
    let characterId = ""
    
    func getCount() -> Int{
        return characterArray.count
    }
    
    func getCharacter(indexPath: IndexPath) -> Character{
        return self.characterArray[indexPath.row]
    }
    
    
    func networkCharacters(name: String?, completion: @escaping (Bool, Error?) -> Void) {
        
        var url: String = ""
        let hash = self.MD5(data: "\(ts)\(privateKey)\(publicKey)")
        if name != nil {
            let nameCharacter: String = name ?? ""
            print(nameCharacter)
            url = "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(nameCharacter)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        }else{
            url = "https://gateway.marvel.com:443/v1/public/characters?limit=100&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        }
        print("============\(url)")
        AF.request(url).responseJSON{
            response in
            if let data = response.data {
                do{
                    let result: CharacterAPIResult = try JSONDecoder().decode(CharacterAPIResult.self, from: data)
                    self.characterArray = result.data.results
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

