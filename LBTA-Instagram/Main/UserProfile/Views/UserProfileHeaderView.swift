//
//  UserProfileHeaderView.swift
//  LBTA-Instagram
//
//  Created by Jason Ngo on 2018-08-20.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class UserProfileHeaderView: UICollectionViewCell {
    
    var user: User? {
        didSet {
            fetchProfileImage()
            usernameLabel.text = self.user?.username
        }
    }
    
    // MARK: - Views
    
    let profileImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.clipsToBounds = true 
        return imageView
    }()
    
    let postsLabel: UILabel = {
        var label = UILabel()
    
        let numberTextAttributes: [NSAttributedStringKey: Any] = [.font: UIFont.boldSystemFont(ofSize: 14)]
        let footerTextAttributes: [NSAttributedStringKey: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.lightGray
        ]
        
        let attributedText = NSMutableAttributedString(string: "11\n", attributes: numberTextAttributes)
        let footerText = NSAttributedString(string: "posts", attributes: footerTextAttributes)
        attributedText.append(footerText)
        
        label.attributedText = attributedText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followingLabel: UILabel = {
        var label = UILabel()
        
        let numberTextAttributes: [NSAttributedStringKey: Any] = [.font: UIFont.boldSystemFont(ofSize: 14)]
        let footerTextAttributes: [NSAttributedStringKey: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.lightGray
        ]
        
        let attributedText = NSMutableAttributedString(string: "11\n", attributes: numberTextAttributes)
        let footerText = NSAttributedString(string: "following", attributes: footerTextAttributes)
        attributedText.append(footerText)
    
        label.attributedText = attributedText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followersLabel: UILabel = {
        var label = UILabel()
        
        let numberTextAttributes: [NSAttributedStringKey: Any] = [.font: UIFont.boldSystemFont(ofSize: 14)]
        let footerTextAttributes: [NSAttributedStringKey: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.lightGray
        ]
        
        let attributedText = NSMutableAttributedString(string: "11\n", attributes: numberTextAttributes)
        let footerText = NSAttributedString(string: "followers", attributes: footerTextAttributes)
        attributedText.append(footerText)
        
        label.attributedText = attributedText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let usernameLabel: UILabel = {
        var label = UILabel()
        label.text = "Username"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let editProfileButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        return button
    }()
    
    let gridButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    let listButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    let bookmarkButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    // MARK: - Init Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupProfileImageView()
        setupUserStatsView()
        setupEditProfileButton()
        setupBottomToolbar()
        setupUsernameLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Set up Functions
    
    fileprivate func setupProfileImageView() {
        self.addSubview(profileImageView)
        
        profileImageView.anchor(top: self.topAnchor, paddingTop: 12, right: nil, paddingRight: 0,
                                bottom: nil, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 12,
                                width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        profileImageView.clipsToBounds = true
    }
    
    fileprivate func setupBottomToolbar() {
        let stackView = UIStackView(arrangedSubviews: [gridButton, listButton, bookmarkButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        let topDividerView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            return view
        }()
        
        let bottomDividerView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            return view
        }()
        
        self.addSubview(stackView)
        self.addSubview(topDividerView)
        self.addSubview(bottomDividerView)
        
        stackView.anchor(top: nil, paddingTop: 0,
                         right: self.rightAnchor, paddingRight: 0,
                         bottom: self.bottomAnchor, paddingBottom: 0,
                         left: self.leftAnchor, paddingLeft: 0,
                         width: 0, height: 50)
        
        topDividerView.anchor(top: stackView.topAnchor, paddingTop: 0,
                              right: self.rightAnchor, paddingRight: 0,
                              bottom: nil, paddingBottom: 0,
                              left: self.leftAnchor, paddingLeft: 0,
                              width: 0, height: 0.5)
        
        bottomDividerView.anchor(top: nil, paddingTop: 0,
                                 right: self.rightAnchor, paddingRight: 0,
                                 bottom: self.bottomAnchor, paddingBottom: 0,
                                 left: self.leftAnchor, paddingLeft: 0,
                                 width: 0, height: 0.5)
    }
    
    fileprivate func setupUsernameLabel() {
        self.addSubview(usernameLabel)
        usernameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 4,
                             right: self.rightAnchor, paddingRight: 12,
                             bottom: gridButton.topAnchor, paddingBottom: 0,
                             left: self.leftAnchor, paddingLeft: 12,
                             width: 0, height: 0)
    }
    
    fileprivate func setupUserStatsView() {
        let stackView = UIStackView(arrangedSubviews: [postsLabel, followingLabel, followersLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        self.addSubview(stackView)
        stackView.anchor(top: self.topAnchor, paddingTop: 8,
                         right: self.rightAnchor, paddingRight: -12,
                         bottom: nil, paddingBottom: 0,
                         left: profileImageView.rightAnchor, paddingLeft: 12,
                         width: 0, height: 50)
    }
    
    fileprivate func setupEditProfileButton() {
        self.addSubview(editProfileButton)
        editProfileButton.anchor(top: postsLabel.bottomAnchor, paddingTop: 0,
                                 right: self.rightAnchor, paddingRight: -12,
                                 bottom: nil, paddingBottom: 0,
                                 left: profileImageView.rightAnchor, paddingLeft: 12,
                                 width: 0, height: 34)
    }
    
    // MARK: - Helper Functions
    
    fileprivate func fetchProfileImage() {
        guard let profileImageUrl = user?.profileImageUrl else { return }
        guard let url = URL(string: profileImageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // check for errors
            if let err = error {
                print("error attempting to fetch profile image: \(err)")
                return
            }
            
            // check the response
            guard let response = response else { return }
            guard let responseHTTP = response as? HTTPURLResponse else { return }
            print("status code: \(responseHTTP.statusCode)")
            
            guard let data = data else { return }
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.profileImageView.image = image
            }
        }.resume()
    }

} // UserProfileHeaderView
