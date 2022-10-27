//  Expo1900 - ExpositionItemsViewController.swift
//  Created by Ayaan, Bella on 2022/10/20.
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class ExpositionItemsViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Property
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    private var expositionItems: [ExpositionUniverselleItem] = []
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchExpositionItems()
        self.navigationController?.isNavigationBarHidden = false
        self.title = NavigationTitle.ExpositionItemView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ExpositionNavigationController.attemptRotationToDeviceOrientation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let nextViewController: ExpositionItemDetailViewController = segue.destination as? ExpositionItemDetailViewController,
              let item: ExpositionUniverselleItem = sender as? ExpositionUniverselleItem else {
            return
        }
        
        nextViewController.item = item
    }
    
    //MARK: - Private Method
    private func fetchExpositionItems() {
        guard let parsedData = JSONParser.parsed(to: [ExpositionUniverselleItem].self) else {
            return
        }
        
        expositionItems = parsedData
    }
}

extension ExpositionItemsViewController: UITableViewDataSource {
    //MARK: - UITableViewDataSource Protocol Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExpositionItemCell = tableView.dequeueReusableCell(withIdentifier: Identifier.expositionTableViewCell, for: indexPath) as? ExpositionItemCell else {
            return UITableViewCell()
        }
        let expositionItem: ExpositionUniverselleItem = self.expositionItems[indexPath.row]
        
        cell.configure(for: expositionItem)
        
        return cell
    }
}

extension ExpositionItemsViewController: UITableViewDelegate {
    //MARK: - UITableViewDelegate Protocol Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Identifier.segueOfShowItemDetail, sender: expositionItems[indexPath.row])
    }
}
