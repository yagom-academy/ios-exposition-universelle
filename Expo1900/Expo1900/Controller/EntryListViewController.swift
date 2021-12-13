import UIKit

class EntryListViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
    }
    
    // MARK: - Method
    
    private func setTitle() {
        title = "한국의 출품작"
    }
    
    // MARK: - Table view data source
    
    private let customCellIdentifier = "expoEntryCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExpoEntries.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as? ExpoEntryCell else {
            fatalError("")
        }
        
        let entry = ExpoEntries.list[indexPath.row]
        cell.setUpView(from: entry)
        
        return cell
    }
    
    // MARK: - Navigation
    
    private let showDetailSegueIdentifier = "showDetailSegueIdentifier"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == showDetailSegueIdentifier,
              let destination = segue.destination as? EntryDetailViewController,
              let indexPath = tableView.indexPathForSelectedRow else {
                  return
              }
        
        destination.expoEntry = ExpoEntries.list[indexPath.row]
    }
}
