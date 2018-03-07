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
        var pacotesApi : Array<PacoteViagem> = []
        
        Alamofire.request(API_URL, method: .get)
            .responseJSON { response in
                if response.data != nil {
                    let json = JSON(data: response.data!)
                    
                    print("json =======> \(json)")
                    
                    //let ceara = Viagem(titulo: "Porto de Galinhas", quantidadeDias: 7, preco: "R$2.490,99", caminhoImagem: "img6.jpg")
                    //let pacote1 = PacoteViagem(nomeDoHotel: "Ceara's Hotel", descricao: "Pacote: Café da manhã + Passagem Aérea", dataViagem: "01~07 de dezembro", quantidadePessoas: "2 adultos", viagem: ceara)
                    
                    
                    //Recupera somentes os 6 primeiros fundos da API
                    for i in 0 ..< 6 {
                        
                        let titulo = json[i]["titulo"].stringValue
                        let quantidadeDias = json[i]["quantidadeDias"].intValue
                        let preco = json[i]["preco"].stringValue
                        let caminhoImagem = json[i]["caminhoImagem"].stringValue
                        let nomeDoHotel = json[i]["nomeDoHotel"].stringValue
                        let descricao = json[i]["descricao"].stringValue
                        let dataViagem = json[i]["dataViagem"].stringValue
                        let quantidadePessoas = json[i]["quantidadePessoas"].stringValue
                        
                        //Carrega fundos da API
                        
                        viagemApi.append(Viagem(titulo: titulo, quantidadeDias: quantidadeDias, preco: preco, caminhoImagem: caminhoImagem)
                        )
                        
                        //Carrega detalhes dos fundos da API
                        pacotesApi.append(PacoteViagem(nomeDoHotel: nomeDoHotel, descricao: descricao, dataViagem: dataViagem, quantidadePessoas: quantidadePessoas, viagem: Viagem(titulo: titulo, quantidadeDias: quantidadeDias, preco: preco, caminhoImagem: caminhoImagem)
                        ))
                        
                    }
                    
                    //Salva os fundos recuperados da API
                    //Dao().saveViagens(fundsApi)
                    
                    //Salva os detalhes dos fundos recuperados da API
                    //Dao().savePacotesViagem(detailApi)
                    
                    completion(true)
                }
        }
        
    }
    
}

