//
//  MilouVC.swift
//  theLastPush
//
//  Created by 지영 on 5/21/25.
//

import UIKit
import SafariServices
import SnapKit

class MilouVC: UIViewController {
    private let member: Member
    private var hasAnimated: Bool = false
    private let milouView: MilouView
    
    init(member: Member) {
        self.member = member
        self.milouView = MilouView(member: member)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !hasAnimated {
            milouView.startMessageAnimation()
            hasAnimated = true
        }
    }
    
    private func setupView() {
        view.addSubview(milouView)
        milouView.delegate = self
        
        milouView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MilouVC: MilouViewButtonDelegate {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func blogButtonTapped() {
        guard let url = URL(string: member.blogURL) else { return }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .popover
        safariVC.dismissButtonStyle = .close
        present(safariVC, animated: true, completion: nil)
    }
}
