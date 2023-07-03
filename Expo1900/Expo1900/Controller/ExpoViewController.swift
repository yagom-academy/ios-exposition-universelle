//
//  ExpoEntryViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

class ExpoViewController: UIViewController {
    
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var expoPosterImageView: UIImageView!
    @IBOutlet weak var expoVisitorsLabel: UILabel!
    @IBOutlet weak var expoLocationLabel: UILabel!
    @IBOutlet weak var expoDurationLabel: UILabel!
    @IBOutlet weak var expoDescriptionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        navigationItem.title = "메인"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updataExpoView()
    }

    @IBAction func TapEntryPageButton(_ sender: UIButton) {
        guard let entryViewController = storyboard?.instantiateViewController(withIdentifier: "entryViewController") as? EntryViewController else { return }
        
        navigationController?.pushViewController(entryViewController, animated: true)
    }
    
    func updataExpoView() {
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

