//
//  PacoteViagemDAO.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class PacoteViagemDAO: NSObject {
    
    func retornaTodasViagens() -> Array<PacoteViagem> {
        let ceara = Viagem(titulo: "Porto de Galinhas", quantidadeDias: 7, preco: "R$2.490,99", caminhoImagem: "img6.jpg")
        let riodejaneiro = Viagem(titulo: "Buzios", quantidadeDias:7, preco: "R$1.990,99", caminhoImagem: "img9.jpg")
        let interiorSP = Viagem(titulo: "Natal", quantidadeDias: 5, preco: "R$1.700,00", caminhoImagem: "img8.jpg")
        let fortaleza = Viagem(titulo: "Fortaleza", quantidadeDias: 4, preco: "R$2.300,00", caminhoImagem: "img7.jpg")
        let amazonas = Viagem(titulo: "Amazonas", quantidadeDias: 6, preco: "R$2.850,00", caminhoImagem: "img10.jpg")
        let salvador = Viagem(titulo: "Salvador", quantidadeDias: 6, preco: "R$1.880,90", caminhoImagem: "img11.jpg")
        
        let pacote1 = PacoteViagem(nomeDoHotel: "Ceara's Hotel", descricao: "Pacote: Café da manhã + Passagem Aérea", dataViagem: "01~07 de dezembro", quantidadePessoas: "2 adultos", viagem: ceara)
        let pacote2 = PacoteViagem(nomeDoHotel: "Copacabana Palace", descricao: "Pacote: Hotel + Passagem Aérea", dataViagem: "09~16 de dezembro", quantidadePessoas: "2 adultos", viagem: riodejaneiro)
        let pacote3 = PacoteViagem(nomeDoHotel: "Atibaia Hotel", descricao: "Pacote: Hotel + café da manhã", dataViagem: "15~20 de julho", quantidadePessoas: "4 adultos", viagem: interiorSP)
        let pacote4 = PacoteViagem(nomeDoHotel: "Fotal Mar", descricao: "Pacote: Hotel + café da manhã", dataViagem: "17~21 de fevereiro", quantidadePessoas: "3 adultos", viagem: fortaleza)
        let pacote5 = PacoteViagem(nomeDoHotel: "Idiana Forest", descricao: "Pacote: Hotel + Passagem Aérea", dataViagem: "10~16 de janeiro", quantidadePessoas: "2 adultos", viagem: amazonas)
        let pacote6 = PacoteViagem(nomeDoHotel: "Salva Amor", descricao: "Pacote: Hotel + café da manhã", dataViagem: "5~10 de novembro", quantidadePessoas: "1 adulto", viagem: salvador)
        
        let listaPacotesViagens : Array<PacoteViagem> = [pacote1, pacote2, pacote3, pacote4, pacote5, pacote6]
        
        return listaPacotesViagens
    }
    
}
