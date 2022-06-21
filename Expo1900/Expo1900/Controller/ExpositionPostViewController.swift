//
//  Expo1900 - ExpositionPostViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionPostViewController: UIViewController {
    private var expositionPostView: ExpositionPostView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.activateOnlyPortraitOrientation(true)
        
        let orientation = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(orientation, forKey: "orientation")
        
        self.title = "메인"
        self.navigationController?.navigationBar.isHidden = true
    }
}

// - MARK: View Settings

extension ExpositionPostViewController {
    private func configureUI() {
        guard let data = fetchData() else {
            return
        }
        expositionPostView = ExpositionPostView(self, expositionPostEntity: data)
    }
    
    private func fetchData() -> ExpositionPostEntity? {
        guard let result = try? JsonParser<ExpositionPostEntity>.fetch(JSONFile.expositionPost.name) else {
            return fetchData()
        }
        
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            self.showErrorAlert(message: error.message)
        }
        
        return fetchData()
    }
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true)
    }
}
