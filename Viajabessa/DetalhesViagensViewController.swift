//
//  DetalhesViagensViewController.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit
import Alamofire

class DetalhesViagensViewController: UIViewController {
    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var textFieldDataValidade: UITextField!
    @IBOutlet weak var activitity: UIActivityIndicatorView!
    
    var pacoteSelecionado : Viagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarscroll(notification:)), name: .UIKeyboardWillShow, object: nil)
        
        if let pacote = pacoteSelecionado {
            
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
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelPrecoPacoteViagem.text = pacote.preco
        }
    }
    
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    func aumentarscroll(notification: Notification) {
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
    }
    
    func exibeDataValidade(sender: UIDatePicker) {
        let formatador = DateFormatter()
        formatador.dateFormat = "dd/MM/yyyy"
        self.textFieldDataValidade.text = formatador.string(from: sender.date)
    }
    
    @IBAction func mostraDataValidade(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataValidade(sender:)), for: .valueChanged)
    }
    
    @IBAction func finalizarCompra(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteComprado = pacoteSelecionado
        self.navigationController?.pushViewController(controller, animated: true)
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
