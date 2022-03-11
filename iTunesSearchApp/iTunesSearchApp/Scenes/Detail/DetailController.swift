//
//  DetailController.swift
//  iTunesSearchApp
//
//  Created by Erdem on 11.03.2022.
//

import UIKit

class DetailController: UIViewController {
    // MARK: - Properties
    var coordinator: DetailCoordinator?
    private var viewModel = DetailViewModel()
    
    // MARK: - View Elements
    private lazy var view_ = DetailView(self)
    
    // MARK: - Constructor Methods
    init(id: String) {
        super.init(nibName: nil, bundle: nil)
                
        viewModel.setId(id)
        view = view_
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle Methods
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getDetails()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Custom Methods
    func getDetails() {
        viewModel.getDetailsFromService()
        viewModel.notifyDetailResponse = { [self] in
            view_.updateView(viewModel.getDetailResponse().getResult())
        }
    }
}

// MARK: - Extension / DetailView Protocol
extension DetailController: DetailViewProtocol {
    
}
