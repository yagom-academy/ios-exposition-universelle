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
        navigationItem.title = ExpoInformationNameSpace.main
    }
    
    private func updateExpoView() {
        do {
            var expoInformation: ExpoInformation = try Decoder.decodeJson(from: AssetsNameSpace.expoInformation)
            expoTitleLabel.text = expoInformation.title.lineAlignment
            expoPosterImageView.image = UIImage(named: AssetsNameSpace.expoPoster)
            expoVisitorsLabel.text = expoInformation.visitors.visitorString
            expoLocationLabel.text = expoInformation.location.locationString
            expoDurationLabel.text = expoInformation.duration.durationString
            expoDescriptionLabel.text = expoInformation.expoDescription
        } catch DecodeError.searchNoFile {
            print(DecodeError.searchNoFile.localizedDescription)
        } catch {
            print(DecodeError.jsonDecodeError.localizedDescription)
        }
    }
}

