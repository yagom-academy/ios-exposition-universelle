//
//  ExhibitOfKoreaViewController.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/09.
//

import UIKit

class ExhibitOfKoreaViewController: UIViewController {
    
    static let storyboardID = "ExhibitOfKoreaViewController"
    @IBOutlet private var tableView: UITableView!
    private var exhibitItem: [ExhibitItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        initThingsUsedInTableView()
        let resultOfFetch = setUpData(fileName: FileName.items, model: [ExhibitItem].self)
        switch resultOfFetch {
        case .success(let data):
            exhibitItem = data
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        setOrientation(orientation: .all)
    }
    
    private func initNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "메인"
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func initThingsUsedInTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let tableViewNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(tableViewNib, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension ExhibitOfKoreaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier : TableViewCell.reuseIdentifier ) as? TableViewCell else {
            return UITableViewCell()
        }
            
        cell.setUpDataOfCell(exhibitItem: exhibitItem[indexPath.row])
            
        return cell
    }
}

extension ExhibitOfKoreaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let exhibitItemViewController = self.storyboard?.instantiateViewController(withIdentifier: ExhibitItemViewController.storyboardID) as? ExhibitItemViewController else { return }
        exhibitItemViewController.exhibitItemData = exhibitItem[indexPath.row]
        navigationController?.pushViewController(exhibitItemViewController, animated: true)
    }
}


