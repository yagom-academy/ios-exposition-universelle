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

    @IBAction private func TapEntryPageButton(_ sender: UIButton) {
        guard let entryViewController = storyboard?.instantiateViewController(withIdentifier: StoryBoardNameSpace.entryViewController) as? EntryViewController else { return }
        
        navigationController?.pushViewController(entryViewController, animated: true)
    }
    
    private func updateNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationItem.title = NameSpace.main
    }
    
    private func updateExpoView() {
        do {
            let expoInformation: ExpoInformation = try Decoder.decodeJson(from: AssetsNameSpace.expoInformation)
            expoTitleLabel.text = expoInformation.title.replacingOccurrences(of: "(", with: "\n(")
            expoPosterImageView.image = UIImage(named: AssetsNameSpace.expoPoster)
            expoVisitorsLabel.text = NameSpace.visitors + NumberFormatter.formatNumberWithComma(expoInformation.visitors)
            expoLocationLabel.text = NameSpace.location + expoInformation.location
            expoDurationLabel.text = NameSpace.duration + expoInformation.duration
            expoDescriptionLabel.text = expoInformation.expoDescription
        } catch DecodeError.searchNoFile {
            print(DecodeError.searchNoFile.localizedDescription)
        } catch {
            print(DecodeError.jsonDecodeError.localizedDescription)
        }
    }
}

extension ExpoViewController {
    private enum NameSpace {
        static let main: String = "메인"
        static let visitors: String = "방문객 : "
        static let location: String = "개최지 : "
        static let duration: String = "개최기간: "
    }
}

