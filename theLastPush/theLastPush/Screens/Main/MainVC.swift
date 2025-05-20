//
//  ViewController.swift
//  theLastPush
//
//  Created by 지영 on 5/19/25.
//

import SnapKit
import UIKit

class MainVC: UIViewController {
    
    private let members: [Member] = memberData
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "THE LAST PUSH"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let introButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "IntroButton")
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var membersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MemberCell.self, forCellWithReuseIdentifier: MemberCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .mainYellow
    }


}

