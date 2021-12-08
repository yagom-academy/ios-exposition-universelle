import UIKit

class EntryTableViewController: UITableViewController {

    var entries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseEntries()
    }

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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let entryDetailViewController = segue.destination as? EntryDetailViewController else {
            return
        }
        guard let entry = sender as? Entry else {
            return
        }
        entryDetailViewController.entry = entry
    }
    
    func parseEntries() {
        do {
            guard let data = NSDataAsset(name: "items") else {
                throw Expo1900Error.dataNotFoundInAsset("items")
            }
            
            entries = try JSONDecoder.shared.decode([Entry].self, from: data.data)
        } catch Expo1900Error.dataNotFoundInAsset(let fileName) {
            print(Expo1900Error.dataNotFoundInAsset(fileName).description)
        } catch {
            print(error)
        }
    }
}

