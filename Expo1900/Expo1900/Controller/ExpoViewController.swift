//
//  ExpoEntryViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

final class ExpoViewController: UIViewController {
    
    @IBOutlet private weak var expoTitleLabel: UILabel!
    @IBOutlet private weak var expoPosterImageView: UIImageView!
    @IBOutlet private weak var expoVisitorsLabel: UILabel!
    @IBOutlet private weak var expoLocationLabel: UILabel!
    @IBOutlet private weak var expoDurationLabel: UILabel!
    @IBOutlet private weak var expoDescriptionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateExpoView()
    }

    @IBAction func TapEntryPageButton(_ sender: UIButton) {
        guard let entryViewController = storyboard?.instantiateViewController(withIdentifier: "entryViewController") as? EntryViewController else { return }
        
        navigationController?.pushViewController(entryViewController, animated: true)
    }
    
    func updateNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationItem.title = "메인"
    }
    
    func updateExpoView() {
        do {
            let expoInformation: ExpoInformation = try Decoder.decodeJson(from: "exposition_universelle_1900")
            expoTitleLabel.text = expoInformation.title
            expoPosterImageView.image = UIImage(named: "poster")
            expoVisitorsLabel.text = "방문객 : \(expoInformation.visitors)"
            expoLocationLabel.text = "개최지 : \(expoInformation.location)"
            expoDurationLabel.text = "개최기간: \(expoInformation.duration)"
            expoDescriptionLabel.text = expoInformation.expoDescription
        } catch DecodeError.searchNoFile {
            print(DecodeError.searchNoFile.localizedDescription)
        } catch {
            print(DecodeError.jsonDecodeError.localizedDescription)
        }
    }
}

