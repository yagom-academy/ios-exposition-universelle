import UIKit

class EntryListViewController: UITableViewController {
    private var expoEntries: [ExpoEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setExpoEntryData()
        setTitle()
    }
    
    private func setExpoEntryData() {
        expoEntries = Parser<[ExpoEntry]>.decode(from: .items) ?? []
    }
}

// MARK: - Method

extension EntryListViewController {
    private func setTitle() {
        self.title = "한국의 출품작"
    }
}

// MARK: - Table view data source

extension EntryListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "expoEntryCell", for: indexPath) as? ExpoEntryCell else {
            fatalError("")
        }
        
        let entry = expoEntries[indexPath.row]
        cell.setUpView(from: entry)
        
        return cell
    }
}

// MARK: - Navigation

extension EntryListViewController {
    static private let showDetailSegueIdentifier = "showDetailSegueIdentifier"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Self.showDetailSegueIdentifier,
              let destination = segue.destination as? EntryDetailViewController,
              let indexPath = tableView.indexPathForSelectedRow else {
                  return
              }
        
        destination.expoEntry = expoEntries[indexPath.row]
    }
}
