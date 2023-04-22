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
    
    private var timer: Timer!
    private let cards = Deck.cards
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(changeCard), userInfo: nil, repeats: true)
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
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50)
        ])
    }
    
    @objc private func stopButtonTapped() {
        timer.invalidate()
    }

    private func initRestartButton() {
        self.view.addSubview(restartButton)
        restartButton.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalTo: stopButton.heightAnchor, multiplier: 1),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func restartButtonTapped() {
        startTimer()
    }
    
    private func initRulesButton() {
        self.view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalTo: restartButton.widthAnchor, multiplier: 1),
            rulesButton.heightAnchor.constraint(equalTo: restartButton.heightAnchor, multiplier: 1),
            rulesButton.leadingAnchor.constraint(equalTo: restartButton.trailingAnchor, constant: 30),
            rulesButton.topAnchor.constraint(equalTo: restartButton.topAnchor)
            
        ])
    }
    
    @objc private func rulesButtonTapped() {
        timer.invalidate()
        present(RulesVC(), animated: true)
    }

    
    @objc private func changeCard() {
        cardImageView.image = cards.randomElement()
    }
}

