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
    
    @IBAction func EnterExhibitOfKoreaButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showExhibitOfKorea", sender: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainData = initExpoData(fileName:"exposition_universelle_1900", model: MainOfExposition.self)

        print(mainData)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
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
