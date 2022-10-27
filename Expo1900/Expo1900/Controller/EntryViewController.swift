//
//  EntryViewController.swift
//  Created by sunnyCookie, Wonbi
// 

import UIKit

final class EntryViewController: UIViewController {
    @IBOutlet weak var entryTableView: UITableView!
    
    private let entries: [Entry]
    
    required init?(coder: NSCoder) {
        guard let entries = JSONDecoder.decode([Entry].self, from: "items") else { return nil }
        
        self.entries = entries
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entryTableView.delegate = self
        entryTableView.dataSource = self
        
        buildNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let orientation = UIDevice.current.orientation.rawValue
        
        UIDevice.current.setValue(orientation, forKey: "orientation")
    }
}

private extension EntryViewController {
    func buildNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        title = "한국의 출품작"
    }
}

extension EntryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailViewController = storyboard?.instantiateViewController(
            identifier: "DetailViewController",
            creator: { coder in
                return DetailViewController(entry: self.entries[indexPath.row], coder: coder)
            }) else { return }
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension EntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "entryCell",
            for: indexPath) as? EntryTableViewCell else { return UITableViewCell() }
        
        cell.buildCell(from: entries[indexPath.row])
        
        return cell
    }
}
