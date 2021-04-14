//
//  MainViewController.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/09.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private var expoTitle: UILabel!
    @IBOutlet private var expoImage: UIImageView!
    @IBOutlet private var expoVisitior: UILabel!
    @IBOutlet private var expoLocation: UILabel!
    @IBOutlet private var expoDuration: UILabel!
    @IBOutlet private var expoDescription: UILabel!
    @IBOutlet private var leftFalgImage: UIImageView!
    @IBOutlet private var rightFlagImage: UIImageView!
    @IBOutlet private var enterExhibitOfKoreaButton: UIButton!
    @IBAction private func enterExhibitOfKoreaButton(_ sender: Any) {
        guard let exhibitOfKoreaViewController = self.storyboard?.instantiateViewController(identifier: ExhibitOfKoreaViewController.storyboardID) as? ExhibitOfKoreaViewController else {
            return
        }
        navigationController?.pushViewController(exhibitOfKoreaViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let resultOfFetch = setUpData(fileName: FileName.expositionUniverselle1900, model: MainOfExposition.self)
        switch resultOfFetch {
        case .success(let data):
            initMainSceneData(data: data)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func initMainSceneData(data: MainOfExposition) {
        let title = data.title.components(separatedBy: "(")
        guard let visitorsNumber = changeNumberDecimalFormat(number: data.visitors) else { return }
        expoTitle.text = title[0] + "\n" + "(" + title[1]
        expoImage.image = UIImage(named: ImageName.poster)
        expoVisitior.text = "방문객" + " : " + visitorsNumber + "명"
        expoLocation.text = "개최지" + " : " + data.location
        expoDuration.text = "개최기간" + " : " + data.duration
        expoDescription.text = data.description
        leftFalgImage.image = UIImage(named: ImageName.flag)
        rightFlagImage.image = UIImage(named: ImageName.flag)
        enterExhibitOfKoreaButton.setTitle("한국의 출품작 보러가기", for: .normal)
    }
    
    private func changeNumberDecimalFormat(number: Int) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let demicalStyleNumber = numberFormatter.string(from: NSNumber(value:number)) else {
            return nil
        }
        
        return demicalStyleNumber
    }
}

extension UIViewController {
    func setUpData<T: Decodable>(fileName: String, model: T.Type) -> Result<T, DataError> {
        switch loadData(name: fileName) {
        case .success(let data):
            return decodeData(data: data, model: model)
        case .failure:
            return .failure(DataError.loadJSON)
        }
    }
    
    private func loadData(name: String) -> Result<NSDataAsset, DataError> {
        guard let jsonData: NSDataAsset = NSDataAsset(name: name)  else {
            return .failure(DataError.loadJSON)
        }
        return .success(jsonData)
    }
    
    private func decodeData<T:Decodable>(data: NSDataAsset, model: T.Type) -> Result<T, DataError> {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try jsonDecoder.decode(T.self, from: data.data)
            return .success(data)
        } catch {
            return .failure(DataError.decodeJSON)
        }
    }
}
