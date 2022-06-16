//
//  Expo1900 - ViewController.swift
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
        self.navigationController?.navigationBar.isHidden = true
    }
}

private extension ExpositionPostViewController {
    func configureUI() {
        guard let expositionPostEntity = JsonParser<ExpositionPostEntity>.fetch("ExpositionPost") else {
            return
        }
        
        expositionPostView = ExpositionPostView(self, data: expositionPostEntity)
        self.navigationController?.navigationBar.isHidden = true
    }
}
