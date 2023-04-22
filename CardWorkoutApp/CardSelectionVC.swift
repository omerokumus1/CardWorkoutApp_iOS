//
//  CardSelectionVC.swift
//  CardWorkoutApp
//
//  Created by Ömer Faruk Okumuş on 21.04.2023.
//

import UIKit

class CardSelectionVC: UIViewController {

    private let cardImageView = UIImageView()
    private let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop!")
    private let restartButton = CWButton(backgroundColor: .systemGreen, title: "Restart")
    private let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        self.view.backgroundColor = .systemBackground
        initCardImageView()
        initStopButton()
        initRestartButton()
        initRulesButton()
    }
    
    private func initCardImageView() {
        self.view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -75)
        ])
    }
    
    private func initStopButton() {
        self.view.addSubview(stopButton)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50)
        ])
    }

    private func initRestartButton() {
        self.view.addSubview(restartButton)
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalTo: stopButton.heightAnchor, multiplier: 1),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    private func initRulesButton() {
        self.view.addSubview(rulesButton)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalTo: restartButton.widthAnchor, multiplier: 1),
            rulesButton.heightAnchor.constraint(equalTo: restartButton.heightAnchor, multiplier: 1),
            rulesButton.leadingAnchor.constraint(equalTo: restartButton.trailingAnchor, constant: 30),
            rulesButton.topAnchor.constraint(equalTo: restartButton.topAnchor)
            
        ])
        
        rulesButton.addTarget(self, action: #selector(goToRulesVC), for: .touchUpInside)
        
    }
    
    @objc private func goToRulesVC() {
        present(RulesVC(), animated: true)
    }

}

