//
//  Expo1900 - ExpositionInfoViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionInfoViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var openPeriodLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var tapPushButton: UIButton!
    
    private weak var alertDelegate: AlertProtocol?
    private var decodingExposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertDelegate = self
        decodingExpositionInfo()
        updateMainViewLabels()
        self.navigationController?.navigationBar.topItem?.title = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        updateScroll()
    }

    private func updateScroll() {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    private func decodingExpositionInfo() {
        let decoder = JSONDecoder()
        
        do {
            let receiveExpositionData = try receiveExpositionInfo()
            decodingExposition = try decoder.decodingContentInfo(
                with: receiveExpositionData,
                modelType: Exposition.self
            )
        } catch DecodingError.fileDecodingError {
            alertDelegate?.showAlert(message:  "파일을 불러오는데 실패했습니다.")
        } catch DecodingError.jsonDecodingError {
            alertDelegate?.showAlert(message:  "파일이 손상되었거나 형식에 맞지 않습니다.")
        } catch {
            alertDelegate?.showAlert(message:  "알 수 없는 오류가 발생했습니다.")
        }
    }
    
    private func receiveExpositionInfo() throws -> Data {
        guard let file = NSDataAsset(name: "exposition_universelle_1900") else {
            throw DecodingError.fileDecodingError
        }
        
        return file.data
    }
    
    private func updateMainViewLabels() {
        let formatManager = NumberFormatter.numberFormatterStyle(.decimal)
        
        guard let exposition = decodingExposition,
              let visitors = formatManager
            .string(from: NSNumber(value: exposition.visitors))
        else {
            return
        }
        
        titleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        visitorLabel.text = "방문객 : \(visitors)명"
        locationLabel.text = "개최지 : \(exposition.location)"
        openPeriodLabel.text = "개최 기간 : \(exposition.duration)"
        descriptionLabel.text = exposition.description
    }
    
    @IBAction func touchUpPushButton(_ sender: UIButton) {
        guard let itemListViewController = storyboard?.instantiateViewController(withIdentifier: "ItemListView") else {
            return
        }
        
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
}

extension ExpositionInfoViewController: AlertProtocol {
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction: UIAlertAction = UIAlertAction(
            title: "확인",
            style: .default) {
                _ in exit(0)
            }
        
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
}
