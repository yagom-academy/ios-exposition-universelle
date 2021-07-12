//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by JINHONG AN on 2021/07/12.
//

import UIKit

class EntryDetailViewController: UIViewController {
    private var entryItem: ExpoEntry?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EntryDetailViewController {
    func configureEntryItem(from data: ExpoEntry) {
        entryItem = data
    }
}
