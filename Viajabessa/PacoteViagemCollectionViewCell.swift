//
//  PacoteViagemCollectionViewCell.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit
import Alamofire

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var activitity: UIActivityIndicatorView!
    
    func configuraCelula(pacote: Viagem) {
        
        //let formataDias = pacote.quantidadeDias == 1 ? "dia" : "dias"
        
        labelTitulo.text = pacote.titulo
        imagemViagem.image = UIImage(named: pacote.caminhoImagem)
        labelQuantidadeDias.text = "\(pacote.quantidadeDias) dias."
        labelPreco.text = pacote.preco
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        self.layer.cornerRadius = 8
        
    }
    
}

