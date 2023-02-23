//
//  ItemDescriptionViewController.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/23.
//

import UIKit

class ItemDescriptionViewController: UIViewController {
    
    let indexPath: IndexPath
    
    init(_ indexPath: IndexPath) {
        super.init(nibName: nil, bundle: nil)
        // 추가적인 초기화 작업 수행
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
    }
    
    private func initializeView() {
        view.backgroundColor = .white
        self.title = "작품명"
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
