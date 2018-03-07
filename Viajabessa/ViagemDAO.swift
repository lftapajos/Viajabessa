//
//  ViagemDAO.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class ViagemDAO: NSObject {
    
    func retornaTodasViagens() -> Array<Viagem> {
        let ceara = Viagem(titulo: "Ceará", quantidadeDias: 3, preco: "R$1.800,00", caminhoImagem: "img1.jpg")
        let riodejaneiro = Viagem(titulo: "Rio de Janeiro", quantidadeDias:6, preco: "R$1.200,00", caminhoImagem: "img2.jpg")
        let interiorSaoPaulo = Viagem(titulo: "Atibaia - São Paulo", quantidadeDias: 1, preco: "R$2.200,00", caminhoImagem: "img3.jpg")
        let fortaleza = Viagem(titulo: "Fortaleza", quantidadeDias: 3, preco: "R$3.500,00", caminhoImagem: "img4.png")
        let salvador = Viagem(titulo: "Salvador", quantidadeDias: 4, preco: "R$3.000,00", caminhoImagem: "img5.jpg")
        
        let listaViagens : Array<Viagem> = [ceara, riodejaneiro, interiorSaoPaulo, fortaleza, salvador]
        
        return listaViagens
    }
    
}

