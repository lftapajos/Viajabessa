//
//  Dao.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import Foundation

class Dao {
    
    // MARK: Declarations
    let viagemArchive: String
    
    // MARK: Constructor
    init() {
        
        //Configura caminho para salvar as informações dos Fundos comprados
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        //print(dir)
        
        //Configura arquivos
        viagemArchive = "\(dir)/viagens.data"
    }
    
    //Salva a lista completa de Viagens
    func saveViagens(_ viagens: Array<Viagem>) {
        NSKeyedArchiver.archiveRootObject(viagens, toFile: viagemArchive)
    }
    
    //Carrega os Viagens salvas
    func loadViagens() -> Array<Viagem> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: viagemArchive) {
            let viagens = loaded as! Array<Viagem>
            return viagens
        }
        return []
    }
    
}
