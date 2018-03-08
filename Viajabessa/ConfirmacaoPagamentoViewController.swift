//
//  ConfirmacaoPagamentoViewController.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit
import Alamofire

class ConfirmacaoPagamentoViewController: UIViewController {
    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var botaoVoltarHome: UIButton!
    @IBOutlet weak var activitity: UIActivityIndicatorView!
    
    var pacoteComprado : Viagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pacote = pacoteComprado {
            
            self.activitity.startAnimating()
            Alamofire.request(pacote.caminhoImagem).responseImage { response in
                //debugPrint(response)
                //debugPrint(response.result)
                
                if let image = response.result.value {
                    DispatchQueue.main.async(execute: {
                        self.activitity.stopAnimating()
                        self.activitity.hidesWhenStopped = true
                        self.imagemPacoteViagem.image = image
                    })
                }
            }
            
            self.labelTituloPacoteViagem.text = pacote.titulo
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
