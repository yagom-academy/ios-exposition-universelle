//
//  Expo1900 - ViewController.swift
//  Created by yeha.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoMainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var explainationTextView: UITextView!
    let expoMainInformationJSONFile = "exposition_universelle_1900"
    let linebreak = "\n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupExpoMainView()
    }
    
    private func setupExpoMainView() {
        guard let expoMainInformation = decodeExpoMainInformationJsonData() else {
            return
        }
        let title = expoMainInformation.title.replacingOccurrences(of: "(", with: linebreak + "(")
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        
        do {
            let visitors = try convertToVisitorFormat(from: expoMainInformation.visitors)
            let visitorsLabelText = visitors.prefix(with: "방문객", separatedBy: " : ")
            visitorsLabel.attributedText = increaseFontSize(of: "방문객", in: visitorsLabelText)
        } catch {
            print(error.localizedDescription)
        }
        let locationLabelText = expoMainInformation.location.prefix(with: "개최지", separatedBy: " : ")
        locationLabel.attributedText = increaseFontSize(of: "개최지", in: locationLabelText)
        let durationLabelText = expoMainInformation.duration.prefix(with: "개최 기간", separatedBy: " : ")
        durationLabel.attributedText = increaseFontSize(of: "개최 기간", in: durationLabelText)
        explainationTextView.text = expoMainInformation.explanation
    }
    
    private func increaseFontSize(of subtext: String, in text: String) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: 25)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: subtext))
        return attributeString
    }
    
    private func convertToVisitorFormat(from number: Int) throws -> String {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        guard let convertedNumber = numberformatter.string(for: number) else {
            throw fatalError()
        }
        return convertedNumber + " 명"
    }
    
    private func decodeExpoMainInformationJsonData() -> ExpoMainInformation? {
        var expoMainInformation: ExpoMainInformation?
        let jsonDecoder = JSONDecoder()
        
        do {
            let jsonData = try convertToNSDataAsset(from: expoMainInformationJSONFile)
            expoMainInformation = try jsonDecoder.decode(ExpoMainInformation.self, from: jsonData.data)
        } catch JSONDataError.fileConversionFailed(let fileName) {
            print(JSONDataError.fileConversionFailed(fileName).description)
        } catch {
            print(error.localizedDescription)
        }
        return expoMainInformation
    }
    
    private func convertToNSDataAsset(from fileName: String) throws -> NSDataAsset  {
        guard let jsonData = NSDataAsset(name: fileName) else {
            throw JSONDataError.fileConversionFailed(fileName)
        }
        return jsonData
    }
}

extension String {
    func prefix(with text: String, separatedBy: String) -> String {
        return text + separatedBy + self
    }
}
