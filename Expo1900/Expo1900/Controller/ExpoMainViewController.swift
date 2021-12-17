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
        navigationItem.title = NavigationTitle.mainView
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
            visitorsLabel.attributedText = createLabelText(titleString: LabelTitle.visitor, contentsString: Symbol.colonWithSpaces + visitors)
        } catch FormatingError.convertNumberFailed {
            print(FormatingError.convertNumberFailed.description)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setupLocationLabel(with expoMainInformation: ExpoMainInformation) {
        locationLabel.applyDynamicType(fontStyle: .title3)
        locationLabel.attributedText = createLabelText(titleString: LabelTitle.location, contentsString: Symbol.colonWithSpaces + expoMainInformation.location)
    }
    
    private func setupDurationLabel(with expoMainInformation: ExpoMainInformation) {
        durationLabel.applyDynamicType(fontStyle: .title3)
        durationLabel.attributedText = createLabelText(titleString: LabelTitle.duration, contentsString: Symbol.colonWithSpaces + expoMainInformation.duration)
    }
    
    private func setupExplanationTextView(with expoMainInformation: ExpoMainInformation) {
        explanationTextView.applyDynamicType(fontStyle: .title3)
        explanationTextView.text = expoMainInformation.explanation
    }
    
    private func createLabelText(titleString: String, contentsString: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: titleString, attributes: [.font: UIFont.preferredFont(forTextStyle: .title2)]))
        attributedString.append(NSAttributedString(string: contentsString, attributes: [.font: UIFont.preferredFont(forTextStyle: .title3)]))
        return attributedString
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
