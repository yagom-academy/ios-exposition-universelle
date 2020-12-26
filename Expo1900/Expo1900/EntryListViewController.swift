import UIKit

final class EntryListViewController: UIViewController {
    
    @IBOutlet weak var entriesListTableView: UITableView!
    
    var entries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData(from: Constants.entriesDataAssetName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func decodeData(from assetName: String) {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: assetName) else {
            return
        }
        
        do {
            self.entries = try jsonDecoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            showAlert(about: .dataSetting)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = entriesListTableView.indexPathForSelectedRow, let detailView = segue.destination as? DetailViewController else {
            showAlert(about: .unknown)
            return
        }
        detailView.entry = entries[indexPath.row]
    }
}

extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = entries[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIndentifier, for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        cell.setEntryInformation(entry)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
