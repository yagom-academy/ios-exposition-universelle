//
//  MainViewController.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/09.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var expoTitle: UILabel!
    @IBOutlet var expoImage: UIImageView!
    @IBOutlet var expoVisitior: UILabel!
    @IBOutlet var expoLocation: UILabel!
    @IBOutlet var expoDuration: UILabel!
    @IBOutlet var expoDescription: UILabel!
    @IBOutlet var leftFalgImage: UIImageView!
    @IBOutlet var rightFlagImage: UIImageView!
    @IBOutlet var EnterExhibitOfKoreaButton: UIButton!
    @IBAction func EnterExhibitOfKoreaButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showExhibitOfKorea", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch initExpoData(fileName:"exposition_universelle_1900", model: MainOfExposition.self) {
        case .success(let data):
            let title = data.title.components(separatedBy: "(")
            var visitorsNumber:String = String(data.visitors)
        
            for offsetElement in 0..<(String(data.visitors).count-1)/3 {
                visitorsNumber.insert(",", at: visitorsNumber.index(visitorsNumber.endIndex, offsetBy: -( 3 * (offsetElement+1) + offsetElement )))
            }
            
            expoTitle.text = title[0] + "\n" + title[1]
            expoImage.image = UIImage(named: "poster")
            expoVisitior.text = "방문객 : " + visitorsNumber + "명"
            expoLocation.text = "개최지 : " + data.location
            expoDuration.text = "개최기간 : " + data.duration
            expoDescription.text = data.description
            leftFalgImage.image = UIImage(named: "flag")
            rightFlagImage.image = UIImage(named: "flag")
            EnterExhibitOfKoreaButton.setTitle("한국의 출품작 보러가기", for: .normal)
            
        case .failure(let error):
            print(error.localizedDescription)
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
}

extension UIViewController {
    func initExpoData<T: Decodable>(fileName: String, model: T.Type) -> Result<T, DataError> {
        let jsonDecoder = JSONDecoder()
        
        guard let jsonData: NSDataAsset = NSDataAsset(name: fileName)  else {
            return .failure(DataError.LoadJSON)
        }
        
        do {
            let data = try jsonDecoder.decode(T.self, from: jsonData.data)
            return .success(data)
        } catch {
            return .failure(DataError.DecodeJSON)
        }
    }
}
