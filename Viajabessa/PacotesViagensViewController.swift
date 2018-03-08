//
//  PacotesViagensViewController.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit
import Alamofire

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    var overlayView = UIView()
    var listaComTodasViagens : Array<Viagem> = []
    var listaPacotesViagens : Array<Viagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Carrega Loading enquanto os dados não são carregados pela chamada da API
        self.overlayView = OverlayView().loadView(self.view)
        self.view.addSubview(self.overlayView)
        
        //Chama a API que salva os Fundos e detalhes dos Fundos
        API().loadApi(completion: { (loaded) in
            
            //Se carregou, mostra os dados
            if (loaded) {
                
                //print("Carregando dados...")
                
                //Remove overlayView
                self.overlayView.removeFromSuperview()
                
                //Alimenta os Fundos no Array
                self.listaPacotesViagens = Dao().loadViagens()
                self.listaComTodasViagens = Dao().loadViagens()
                
                self.labelContadorPacotes.text = self.atualizaContadorLabel()
                
                //Recarrega a collectionView
                self.colecaoPacotesViagem.reloadData()
            }
            
        }, failureBlock: {
            //Erro ao carregar dados da API
            //Alert(controller: self).show("Sorry", message: "Error to load data")
        })
        
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaPacotesViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let pacoteAtual = listaPacotesViagens[indexPath.item]
        celulaPacote.configuraCelula(pacote: pacoteAtual)
        celulaPacote.activitity.startAnimating()
        
        Alamofire.request(listaPacotesViagens[indexPath.row].caminhoImagem).responseImage { response in
            //debugPrint(response)
            //debugPrint(response.result)
            
            if let image = response.result.value {
                DispatchQueue.main.async(execute: {
                    celulaPacote.activitity.stopAnimating()
                    celulaPacote.activitity.hidesWhenStopped = true
                    celulaPacote.imagemViagem.image = image
                })
            }
        }
        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let larguraCelula = collectionView.bounds.width
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: larguraCelula/2-20, height: 160) : CGSize(width: larguraCelula/3-20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaPacotesViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        listaPacotesViagens = listaComTodasViagens
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "titulo contains %@", searchText)
            let listaFiltrada : Array<Viagem> = (listaPacotesViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaPacotesViagens = listaFiltrada
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizaContadorLabel() -> String {
        return listaPacotesViagens.count == 1 ? "1 pacote encontrado" : "\(listaPacotesViagens.count) pacotes encontrados"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
