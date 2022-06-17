import UIKit

final class KoreanContentListViewController: UIViewController {
    @IBOutlet private weak var contentTableView: UITableView!

    private var contents: [Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTableView.dataSource = self
        contentTableView.delegate = self
        contentTableView.rowHeight = 150

        do {
            contents = try decodeContentData()
        } catch let error as DataHandlingError {
            print(error.description)
        } catch {
            print("Undexpected error: \(error)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func decodeContentData() throws -> [Content] {
        guard let koreanContents = NSDataAsset.init(name: "items") else { throw DataHandlingError.invalidFile }
        
        let jsonDecoder = JSONDecoder()
        let contents = try jsonDecoder.decode([Content].self, from: koreanContents.data)
        
        return contents
    }
}

extension KoreanContentListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as? ContentCell ?? ContentCell()
        let currentContent = contents[indexPath.row]
        
        cell.descriptionLabel.numberOfLines = 0
        cell.titleLabel.font = .preferredFont(forTextStyle: .title2)
        cell.accessoryType = .disclosureIndicator
        
        cell.contentImageView.image = UIImage(named: currentContent.imageName)
        cell.titleLabel.text = currentContent.name
        cell.descriptionLabel.text = currentContent.shortDescription
        
        return cell
    }
}

extension KoreanContentListViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contentViewSegue" {
            guard let contentViewController = segue.destination as? contentViewController else { return }
            guard let indexPath = sender as? IndexPath else { return }
            
            contentViewController.content = contents[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "contentViewSegue", sender: indexPath)
    }
}
