//
//  ViewController.swift
//  CardWorkoutApp
//
//  Created by Ömer Faruk Okumuş on 21.04.2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    private let cards = Deck.cards
    private var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    
    @objc private func changeCard() {
        cardImageView.image = cards.randomElement()
    }

    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    @IBAction func rulesButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(changeCard), userInfo: nil, repeats: true)
    }
    
}

