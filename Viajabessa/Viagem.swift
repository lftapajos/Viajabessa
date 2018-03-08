//
//  Viagem.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class Viagem: NSObject, NSCoding {
    
    let titulo: String
    let quantidadeDias: String
    let preco: String
    let caminhoImagem: String
    let nomeDoHotel: String
    let descricao: String
    let dataViagem: String
    let quantidadePessoas: String
    
    init(titulo: String, quantidadeDias: String, preco: String, caminhoImagem: String, nomeDoHotel: String, descricao: String, dataViagem: String, quantidadePessoas: String) {
        self.titulo = titulo
        self.quantidadeDias = quantidadeDias
        self.preco = preco
        self.caminhoImagem = caminhoImagem
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.quantidadePessoas = quantidadePessoas
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.titulo             = aDecoder.decodeObject(forKey : "titulo") as! String
        self.quantidadeDias     = aDecoder.decodeObject(forKey : "quantidadeDias") as! String
        self.preco              = aDecoder.decodeObject(forKey : "preco") as! String
        self.caminhoImagem      = aDecoder.decodeObject(forKey : "caminhoImagem") as! String
        self.nomeDoHotel        = aDecoder.decodeObject(forKey : "nomeDoHotel") as! String
        self.descricao          = aDecoder.decodeObject(forKey : "descricao") as! String
        self.dataViagem         = aDecoder.decodeObject(forKey : "dataViagem") as! String
        self.quantidadePessoas  = aDecoder.decodeObject(forKey : "quantidadePessoas") as! String
    }
    
    // MARK: Methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(titulo, forKey: "titulo")
        aCoder.encode(quantidadeDias, forKey : "quantidadeDias")
        aCoder.encode(preco, forKey : "preco")
        aCoder.encode(caminhoImagem, forKey : "caminhoImagem")
        aCoder.encode(nomeDoHotel, forKey: "nomeDoHotel")
        aCoder.encode(descricao, forKey : "descricao")
        aCoder.encode(dataViagem, forKey : "dataViagem")
        aCoder.encode(quantidadePessoas, forKey : "quantidadePessoas")
    }
    
}
