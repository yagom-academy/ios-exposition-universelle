//
//  Expo1900 - ViewController.swift
//  Created by yeha.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoMainViewController: UIViewController {
    
    private enum LabelTitle {
        static let visitor = "방문객"
        static let location = "개최지"
        static let duration = "개최 기간"
    }
    
    private enum Symbol {
        static let linebreak = "\n"
        static let openingParenthesis = "("
        static let colonWithSpaces = " : "
        static let koreanPeopleUnit = " 명"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var explanationTextView: UITextView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupExpoMainView()
        setUpNavigationBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        appDelegate.supportOnlyPortrait = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        appDelegate.supportOnlyPortrait = false
    }
    
    private func setUpNavigationBarItem() {
        navigationItem.title = "메인"
    }
    
    private func setupExpoMainView() {
        guard let expoMainInformation = decodeExpoMainInformationJsonData() else {
            return
        }
        setupTitleLabel(with: expoMainInformation)
        setupVisitorsLabel(with: expoMainInformation)
        setupLocationLabel(with: expoMainInformation)
        setupDurationLabel(with: expoMainInformation)
        setupExplanationTextView(with: expoMainInformation)
    }
    
    private func setupTitleLabel(with expoMainInformation: ExpoMainInformation) {
        titleLabel.applyDynamicType(fontStyle: .title1)
        titleLabel.textAlignment = .center
        let title = expoMainInformation.title.replacingOccurrences(of: Symbol.openingParenthesis, with: Symbol.linebreak + Symbol.openingParenthesis)
        titleLabel.text = title
    }
    
    private func setupVisitorsLabel(with expoMainInformation: ExpoMainInformation) {
        visitorsLabel.applyDynamicType(fontStyle: .title3)
        do {
            let visitors = try convertToVisitorFormat(from: expoMainInformation.visitors)
            let visitorsLabelText = visitors.prefix(with: LabelTitle.visitor, separatedBy: Symbol.colonWithSpaces)
            visitorsLabel.attributedText = increaseFontSize(of: LabelTitle.visitor, in: visitorsLabelText)
        } catch FormatingError.convertNumberFailed {
            print(FormatingError.convertNumberFailed.description)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setupLocationLabel(with expoMainInformation: ExpoMainInformation) {
        locationLabel.applyDynamicType(fontStyle: .title3)
        let locationLabelText = expoMainInformation.location.prefix(with: LabelTitle.location, separatedBy: Symbol.colonWithSpaces)
        locationLabel.attributedText = increaseFontSize(of: LabelTitle.location, in: locationLabelText)
    }
    
    private func setupDurationLabel(with expoMainInformation: ExpoMainInformation) {
        durationLabel.applyDynamicType(fontStyle: .title3)
        let durationLabelText = expoMainInformation.duration.prefix(with: LabelTitle.duration, separatedBy: Symbol.colonWithSpaces)
        durationLabel.attributedText = increaseFontSize(of: LabelTitle.duration, in: durationLabelText)
    }
    
    private func setupExplanationTextView(with expoMainInformation: ExpoMainInformation) {
        explanationTextView.applyDynamicType(fontStyle: .title3)
        explanationTextView.text = expoMainInformation.explanation
    }
    
    private func increaseFontSize(of subtext: String, in text: String) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont.preferredFont(forTextStyle: .title2)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: subtext))
        return attributeString
    }
    
    private func convertToVisitorFormat(from number: Int) throws -> String {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        guard let convertedNumber = numberformatter.string(for: number) else {
            throw FormatingError.convertNumberFailed
        }
        return convertedNumber + Symbol.koreanPeopleUnit
    }
    
    private func decodeExpoMainInformationJsonData() -> ExpoMainInformation? {
        var expoMainInformation: ExpoMainInformation?
        let jsonDecoder = JSONDecoder()
        
        do {
            let jsonData = try convertToNSDataAsset(from: JSONFile.expoMainInformation)
            expoMainInformation = try jsonDecoder.decode(ExpoMainInformation.self, from: jsonData.data)
        } catch JSONDataError.fileNotFound(let fileName) {
            print(JSONDataError.fileNotFound(fileName).description)
        } catch {
            print(error.localizedDescription)
        }
        return expoMainInformation
    }
    
    private func convertToNSDataAsset(from fileName: String) throws -> NSDataAsset  {
        guard let jsonData = NSDataAsset(name: fileName) else {
            throw JSONDataError.fileNotFound(fileName)
        }
        return jsonData
    }
}
