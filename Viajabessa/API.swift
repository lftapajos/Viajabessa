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
                    
                    for i in 0 ..< json.count {
                        
                        let titulo = json[i]["titulo"].stringValue
                        let quantidadeDias = json[i]["quantidadeDias"].stringValue
                        let preco = json[i]["preco"].stringValue
                        let caminhoImagem = json[i]["caminhoImagem"].stringValue
                        let nomeDoHotel = json[i]["nomeDoHotel"].stringValue
                        let descricao = json[i]["descricao"].stringValue
                        let dataViagem = json[i]["dataViagem"].stringValue
                        let quantidadePessoas = json[i]["quantidadePessoas"].stringValue
                        
                        //Carrega Viagens da API
                        viagemApi.append(Viagem(titulo: titulo, quantidadeDias: quantidadeDias, preco: preco, caminhoImagem: caminhoImagem, nomeDoHotel: nomeDoHotel, descricao: descricao, dataViagem: dataViagem, quantidadePessoas: quantidadePessoas)
                        )
                    }
                    
                    //Salva as Viagens recuperadas da API
                    Dao().saveViagens(viagemApi)
                    
                    completion(true)
                }
        }
    }
    
    func enviaEstatisticas(systemVersion: String, model: String, modelName: String) {
        
        //função para enviar relatório do Device do usuário para o Sistema
        print("Versão do Device: \(systemVersion)")
        print("Marca do Device: \(model)")
        print("Modelo de Device: \(modelName)")
        
        let parameters = ["systemVersion": systemVersion, "model": model, "modelName": modelName]
        Alamofire.request(API_URL_Stats, method: .get, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                //debugPrint(response)
                if response.data != nil {
                    let json = JSON(data: response.data!)
                    let retorno = json[0]["Stats"].stringValue
                    print("Enviou? \(retorno)")
                }
        }
    }
}

