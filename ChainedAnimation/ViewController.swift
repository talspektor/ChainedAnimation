//
//  ViewController.swift
//  ChainedAnimation
//
//  Created by user140592 on 2/17/19.
//  Copyright © 2019 talspektor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    //setup UI
    let titleLable = UILabel()
    let bodyLabel = UILabel()
    
    fileprivate func setupLabelsFunc() {
       
        titleLable.text = "Welcome to Company XYZ"
        titleLable.font = UIFont(name: "Futura", size: 34)
        titleLable.numberOfLines = 0
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Hello there! Thanks so mach fo downloading our brand new app and giving us "
    }
    
    private func setupStakView() {
        let stackView = UIStackView(arrangedSubviews: [titleLable,bodyLabel])
        stackView.axis = .vertical
        
        stackView.spacing = 8
        view.addSubview(stackView)
        //enable auto layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabelsFunc()
        setupStakView()
        
        // fun animations
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation)))
    }

    @objc private func handleTapAnimation() {
        print("Animating")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titleLable.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLable.alpha = 0
                self.titleLable.transform = self.titleLable.transform.translatedBy(x: 0, y: -200)
                
            })
            
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
                
            })
            
        }
    }
}

