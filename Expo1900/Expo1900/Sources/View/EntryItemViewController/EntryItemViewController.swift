//
//  EntryItemViewController.swift
//  Expo1900
//
//  Created by morgan, uemu on 2023/11/02.
//

import UIKit


final class EntryItemViewController: UIViewController, Identifying {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var entryItems: [Exposition.EntryItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationUI()
        useProtocol()
        decodeJSONData()
    }
    
    private func configureNavigationUI () {
        self.navigationController?.isNavigationBarHidden = false
        let backBarButtonItem = UIBarButtonItem(
            title: "한국의 출품작",
            style: .plain,
            target: self,
            action: nil
        )
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func useProtocol() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func decodeJSONData() {
        do {
            entryItems = try UniverselleDecoder.decodeAssetData(assetName: "items", decoder: JSONDecoder())
        } catch {
            let newAlertConfiguration = AlertConfiguration(title: AlertMessage.errorAlertTitle.description, message: AlertMessage.noJSONData.description, actionTitle: AlertMessage.confirm.description)
            return ShowAlert.presentAlert(viewController: self, configuration: newAlertConfiguration)
        }
    }
}

extension EntryItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        guard let selectedItem = entryItems?[safe: indexPath.row] else {
            let newAlertConfiguration = AlertConfiguration(title: AlertMessage.errorAlertTitle.description, message: AlertMessage.noJSONItems.description, actionTitle: AlertMessage.confirm.description)
            return ShowAlert.presentAlert(viewController: self, configuration: newAlertConfiguration)
        }
        
        let thirdStoryboard: UIStoryboard? = UIStoryboard(name: StoryBoardName.DescriptionDetail.description, bundle: .main)
        
        guard let nextViewController = thirdStoryboard?.instantiateViewController(identifier: DescriptionDetailViewController.reuseIdentifier, creator: {
            coder in DescriptionDetailViewController(coder: coder, titleName: selectedItem.name, descriptionText: selectedItem.description, imageName: selectedItem.imageName)
        } ) else {
            let newAlertConfiguration = AlertConfiguration(title: AlertMessage.errorAlertTitle.description, message: AlertMessage.noNextViewController.description, actionTitle: AlertMessage.confirm.description)
            return ShowAlert.presentAlert(viewController: self, configuration: newAlertConfiguration)
        }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension EntryItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entryItemsCount = entryItems?.count else { return .zero }
        
        return entryItemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EntryItemCell.reuseIdentifier, for: indexPath) as? EntryItemCell else {
            return UITableViewCell()
        }
        
        guard let entryItem = entryItems?[safe: indexPath.row] else {
            return UITableViewCell()
        }

        cell.injectData(
            title: entryItem.name,
            description: entryItem.shortDesc,
            imageName: entryItem.imageName
        )
        
        return cell
    }
}
