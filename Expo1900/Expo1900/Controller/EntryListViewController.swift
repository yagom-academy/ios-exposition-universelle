import UIKit

class EntryListViewController: UITableViewController {
    private var expoEntries: [ExpoEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setExpoEntryData()
        self.title = "한국의 출품작"
        self.navigationItem.backButtonTitle = "메인"
    }
    
    private func setExpoEntryData() {
        expoEntries = Parser<[ExpoEntry]>.decode(from: .items) ?? []
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
        cell.setUp(data: entry)
        
        return cell
    }
}
