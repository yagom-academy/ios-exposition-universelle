//
//  ExpoHomeViewController.swift
//  Expo1900
//
//  Created by 유한석 on 2022/06/17.
//

import UIKit

class ExpoHomeViewController: UIViewController {
    private var exposition: Exposition?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftFlagImageView: UIImageView!
    @IBOutlet weak var rightFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonData("exposition", "json")
    }
    
    @IBAction func pushToExpoMenuButtonDidTap(_ sender: UIButton) {
    }
    
    private func loadJsonData(_ fileName: String, _ extensionName: String) {
        let jsonDecoder = JSONDecoder()
        let fileUrl = loadFileLocation(fileName, extensionName)
        do {
            let data = try Data(contentsOf: fileUrl)
            let decodedData = try jsonDecoder.decode(Exposition.self, from: data)
            exposition = decodedData
        } catch {
            fatalError("JSON DATA LOAD ERROR: \(fileName),\(extensionName)")
        }
    }
    
    private func loadFileLocation(_ fileName: String, _ extensionName: String) -> URL {
        guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: extensionName) else {
            return URL(fileURLWithPath: "")
        }
        return fileLocation
    }
}
