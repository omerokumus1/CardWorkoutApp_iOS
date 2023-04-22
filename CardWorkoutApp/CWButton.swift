//
//  CWButton.swift
//  CardWorkoutApp
//
//  Created by Ömer Faruk Okumuş on 22.04.2023.
//

import UIKit

class CWButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    init(backgroundColor: UIColor, title: String) {
        // x, y, width, height are zero. Button will be constraint later manually
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
