//
//  ListViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/14.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.delegate = self
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        var contents = cell.defaultContentConfiguration()
        contents.attributedText = NSAttributedString(string: "직지심체요절", attributes: [ .font: UIFont.systemFont(ofSize: 20, weight: .bold)])
        contents.secondaryText = "1900년 파리 만국박람회(지금의 세계 박람회[World’s Fair/Exposition/Expo])는 지난 세기를 기념하고 다음 세기를 향한 발전을 가속하자는 의미에서 1900년 4월 14일부터 11월 12일까지 프랑스 파리"
        contents.image = UIImage(named: "jikji.png")
        contents.imageProperties.maximumSize.width = CGFloat(100)

        cell.contentConfiguration = contents
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
}
