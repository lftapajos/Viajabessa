//
//  ConfirmacaoPagamentoViewController.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {
    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var botaoVoltarHome: UIButton!
    
    var pacoteComprado : PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pacote = pacoteComprado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelHotelPacoteViagem.text = pacote.nomeDoHotel
            self.labelDataPacoteViagem.text = pacote.dataViagem
            self.labelQuantidadePessoas.text = pacote.quantidadePessoas
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            
            self.imagemPacoteViagem.layer.cornerRadius = 10
            self.imagemPacoteViagem.layer.masksToBounds = true
            
            self.botaoVoltarHome.layer.cornerRadius = 8
            
        }
    }
    
    @IBAction func voltarHome(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
