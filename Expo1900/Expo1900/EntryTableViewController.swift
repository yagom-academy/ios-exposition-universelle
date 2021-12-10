import UIKit

class EntryTableViewController: UITableViewController {

    //MARK: - Instance Properties
    
    private var entries: [Entry] = []
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseEntriesFromAsset()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let entryDetailViewController = segue.destination as? EntryDetailViewController,
              let entry = sender as? Entry else { return }
        
        entryDetailViewController.entry = entry
    }
}

//MARK: - Private Methods

extension EntryTableViewController {
    private func parseEntriesFromAsset() {
        do {
            guard let data = NSDataAsset(name: JSONAssetNameList.entry.rawValue) else {
                throw Expo1900Error.dataNotFoundInAsset(JSONAssetNameList.entry.rawValue)
            }
            entries = try JSONDecoder.shared.decode([Entry].self, from: data.data)
        } catch Expo1900Error.dataNotFoundInAsset(let fileName) {
            print(Expo1900Error.dataNotFoundInAsset(fileName))
        } catch {
            print(error)
        }
    }
}

//MARK: - TableView Methods

extension EntryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let entry = entries[indexPath.row]
        content.text = entry.name
        content.secondaryText = entry.shortDescription
        content.image = UIImage(named: entry.imageName)
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toEntryDetail", sender: entries[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
