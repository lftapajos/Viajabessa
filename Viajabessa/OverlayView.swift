//
//  OverlayView.swift
//  Viajabessa
//
//  Created by Luis Felipe Tapajos on 07/03/18.
//  Copyright © 2018 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class OverlayView {
    
    func loadView(_ view: UIView) -> UIView {
        
        //Overlay View
        let overlayView = UIView(frame: view.frame)
        overlayView.backgroundColor = UIColor.black
        overlayView.alpha = 0.8
        
        //Label
        let innerLabel = UILabel()
        innerLabel.textColor = UIColor.black
        innerLabel.frame = CGRect(x: (view.frame.size.width - 200)/2 , y: 0, width: 95, height: 50)
        innerLabel.text = "Carregando ..."
        innerLabel.backgroundColor = UIColor.clear
        
        //View Center
        let innerView = UIView()
        innerView.backgroundColor = UIColor.white
        innerView.layer.cornerRadius = 10
        innerView.frame = CGRect(x: (view.frame.size.width - 200)/2 , y: (view.frame.size.height - 50)/2, width: 200, height: 50)
        
        //Add Label
        innerView.addSubview(innerLabel)
        
        //Add Inner View
        overlayView.addSubview(innerView)
        
        return overlayView
    }
    
}
