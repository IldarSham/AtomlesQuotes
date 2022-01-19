//
//  QuotesView.swift
//  AtomlesQuotes
//
//  Created by Ildar on 11.01.2022.
//

import UIKit

class QuotesView: UIView {
    
    // MARK: - Actions
    @objc private func refresh(_ sender: UIButton) {
        didPressRefreshButton?()
    }
    
    // MARK: - Properties
    var didPressRefreshButton: (() -> Void)?

    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "atomles"))
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.9
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Dimensions.characterImageWidth / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let quoteLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549998119, green: 0.4515720169, blue: 0.1347271782, alpha: 1)
        label.font = UIFont(name: "MarkerFelt-Wide", size: Dimensions.quoteFontSize)!
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let copyrightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "MarkerFelt-Wide", size: Dimensions.copyrightFontSize)!
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.alpha = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let refreshButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .bold, scale: .default)
        let image = UIImage(systemName: "arrow.clockwise", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(refresh), for: .touchUpInside)
        return button
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = #colorLiteral(red: 0.2549998119, green: 0.4515720169, blue: 0.1347271782, alpha: 1)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addBackgroundImageView()
        addCharacterImageView()
        addStackView()
        addQuoteLabel()
        addCopyrightLabel()
        addRefreshButton()
        addActivityIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func addBackgroundImageView() {
        self.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    private func addCharacterImageView() {
        self.addSubview(characterImageView)
        
        NSLayoutConstraint.activate([
            characterImageView.widthAnchor.constraint(equalToConstant: Dimensions.characterImageWidth),
            characterImageView.heightAnchor.constraint(equalToConstant: Dimensions.characterImageHeight),
            characterImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            characterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func addStackView() {
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 15),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
    private func addQuoteLabel() {
        stackView.addArrangedSubview(quoteLabel)
    }
    
    private func addCopyrightLabel() {
        stackView.addArrangedSubview(copyrightLabel)
        
        copyrightLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private func addRefreshButton() {
        self.addSubview(refreshButton)

        NSLayoutConstraint.activate([
            refreshButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            refreshButton.topAnchor.constraint(equalTo: characterImageView.topAnchor)
        ])
    }
    
    private func addActivityIndicator() {
        self.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
