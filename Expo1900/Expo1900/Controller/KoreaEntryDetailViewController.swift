//
//  KoreaEntryDetailViewController.swift
//  Expo1900
//
//  Created by 김태훈 on 2022/04/14.
//

import UIKit

final class KoreaEntryDetailViewController: UIViewController {
    @IBOutlet weak var koreaEntryImageView: UIImageView!
    @IBOutlet weak var koreaEntryFullDescriptionLabel: UILabel!
    
    var koreaEntryData: KoreaEntryDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = koreaEntryData?.name
        koreaEntryFullDescriptionLabel.text = koreaEntryData?.fullDescription
        koreaEntryImageView.image = UIImage(named: koreaEntryData!.imageFileName)
    }
}
