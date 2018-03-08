//
//  API.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireImage

class API {
    
    //Carrega os dados vindos da API
    func loadApi(completion: @escaping (Bool)->(), failureBlock: @escaping ()->Void) {
        
        var viagemApi : Array<Viagem> = []
        
        Alamofire.request(API_URL, method: .get)
            .responseJSON { response in
                if response.data != nil {
                    let json = JSON(data: response.data!)
                    
                    //print("json =======> \(json)")
                    
                    //Recupera somentes os 6 primeiros fundos da API
                    for i in 0 ..< json.count {
                        
                        let titulo = json[i]["titulo"].stringValue
                        let quantidadeDias = json[i]["quantidadeDias"].stringValue
                        let preco = json[i]["preco"].stringValue
                        let caminhoImagem = json[i]["caminhoImagem"].stringValue
                        let nomeDoHotel = json[i]["nomeDoHotel"].stringValue
                        let descricao = json[i]["descricao"].stringValue
                        let dataViagem = json[i]["dataViagem"].stringValue
                        let quantidadePessoas = json[i]["quantidadePessoas"].stringValue
                        
                        //print("titulo ==> \(titulo)")
                        
                        //Carrega fundos da API
                        
                        viagemApi.append(Viagem(titulo: titulo, quantidadeDias: quantidadeDias, preco: preco, caminhoImagem: caminhoImagem, nomeDoHotel: nomeDoHotel, descricao: descricao, dataViagem: dataViagem, quantidadePessoas: quantidadePessoas)
                        )
                    }
                    
                    //Salva as Viagens recuperadas da API
                    Dao().saveViagens(viagemApi)
                    
                    completion(true)
                }
        }
        
    }
}

