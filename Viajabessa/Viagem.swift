//
//  Viagem.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    
    let titulo: String
    let quantidadeDias: Int
    let preco: String
    let caminhoImagem: String
    
    init(titulo: String, quantidadeDias: Int, preco: String, caminhoImagem: String) {
        self.titulo = titulo
        self.quantidadeDias = quantidadeDias
        self.preco = preco
        self.caminhoImagem = caminhoImagem
    }
}
