//
//  KoreanEntriesViewController.swift
//  Expo1900
//
//  Created by Hamo, Mene on 19/10/2022.
//

import UIKit

final class KoreanEntriesViewController: UIViewController {
    @IBOutlet private weak var entriesTableView: UITableView!
    
    private var koreanEntries: [ExhibitionEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchKoreanEntries()
    }
    
    private func fetchKoreanEntries() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.koreanEntries = try jsonDecoder.decode([ExhibitionEntry].self,
                                                                from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
