//
//  PacoteViagem.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class PacoteViagem: NSObject {
    
    let nomeDoHotel: String
    let descricao: String
    let dataViagem: String
    let quantidadePessoas: String
    let viagem: Viagem
    
    init(nomeDoHotel: String, descricao: String, dataViagem: String, quantidadePessoas: String, viagem: Viagem) {
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.quantidadePessoas = quantidadePessoas
        self.viagem = viagem
    }
    
}

