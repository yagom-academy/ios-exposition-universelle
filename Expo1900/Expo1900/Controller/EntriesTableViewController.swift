import UIKit

class EntriesTableViewController: UITableViewController {
    private let expositionEntries: [ExpositionEntry]? = {
        guard let entriesData = NSDataAsset(name: "items") else {
            return nil
        }
        let entries = try? JSONDecoder().decode([ExpositionEntry].self, from: entriesData.data)
        return entries
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionEntries?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        var contents = cell.defaultContentConfiguration()
        contents.textProperties.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        contents.text = expositionEntries?[indexPath.row].name
        contents.secondaryText = expositionEntries?[indexPath.row].shortDescription
        contents.image = expositionEntries?[indexPath.row].image
        contents.imageProperties.maximumSize.height = 50
        contents.imageProperties.maximumSize.width = 50
        cell.contentConfiguration = contents
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryDetailViewController = storyboard?.instantiateViewController(withIdentifier: "entryDetailView") as? EntryDetailViewController else {
            return
        }
        let title = expositionEntries?[indexPath.row].name
        let image = expositionEntries?[indexPath.row].image
        let description = expositionEntries?[indexPath.row].description
        entryDetailViewController.setData(image: image, description: description)
        entryDetailViewController.navigationItem.title = title
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
