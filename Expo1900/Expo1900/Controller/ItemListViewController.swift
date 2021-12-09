import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var itemListTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemListTableVIew.register(nib, forCellReuseIdentifier: "TableViewCell")
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
