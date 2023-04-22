//
//  RulesVC.swift
//  CardWorkoutApp
//
//  Created by Ömer Faruk Okumuş on 22.04.2023.
//

import UIKit

class RulesVC: UIViewController {
    private let titleLabel = UILabel()
    private let rulesLabel = UILabel()
    private let exercisesLabel = UILabel()
    private let closeButton = CWButton(backgroundColor: .clear, title: "Close")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    private func initUI() {
        self.view.backgroundColor = .systemBackground
        initTitleLabel()
        initRulesLabel()
        initExercisesLabel()
        initCloseButton()
    }

    private func initTitleLabel() {
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 75),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
        ])
        
    }
    
    private func initRulesLabel() {
        self.view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = "The value of each card represents the number of exercise you do.  J = 11, Q = 12, K = 13, A = 14"
        rulesLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            rulesLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            rulesLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40)
        ])
        
    }
    
    private func initExercisesLabel() {
        self.view.addSubview(exercisesLabel)
        exercisesLabel.translatesAutoresizingMaskIntoConstraints = false
        exercisesLabel.text = "♠️ = Push-ups  ❤️ = Sit-ups  ♣️ = Burpees  ♦️ = Jumping Jacks"
        exercisesLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        exercisesLabel.textAlignment = .left
        exercisesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            exercisesLabel.leadingAnchor.constraint(equalTo: rulesLabel.leadingAnchor, constant: 60),
            exercisesLabel.trailingAnchor.constraint(equalTo: rulesLabel.trailingAnchor, constant: -60),
            exercisesLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 40)
        ])
    }
    
    private func initCloseButton() {
        self.view.addSubview(closeButton)
        closeButton.setTitleColor(.systemBlue, for: .normal)
        closeButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 75),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
            
        ])
        
        closeButton.addTarget(self, action: #selector(closeRulesVC), for: .touchUpInside)
    }
    
    @objc private func closeRulesVC() {
        self.dismiss(animated: true)
    }

}
