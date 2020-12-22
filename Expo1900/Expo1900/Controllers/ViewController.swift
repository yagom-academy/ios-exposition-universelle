import UIKit

class ViewController: UIViewController {
    
    var posterInformation: Exposition?
    var expositionPosterScrollView: ExpositionPosterScrollView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expositionPosterScrollView = ExpositionPosterScrollView()
        guard let expositionPosterScrollView = expositionPosterScrollView else {
            return
        }
        expositionPosterScrollView.expositionPosterScrollViewDelegate = self
        view.addSubview(expositionPosterScrollView)
        getPosterInformation()
        expositionPosterScrollView.configurePoster(with: posterInformation)
        setupConstraints(scrollView: expositionPosterScrollView)
    }
    
    //MARK: - Private
    private func setupConstraints(scrollView: ExpositionPosterScrollView) {
        var constraints = [NSLayoutConstraint]()
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    private func getPosterInformation() {
        if let data = NSDataAsset(name: "exposition_universelle_1900")?.data {
            let decoder = JSONDecoder()
            do {
                let taskData = try decoder.decode(Exposition.self, from: data)
                posterInformation = taskData
            } catch let error {
                print(error)
            }
        }
    }
}

extension ViewController: ExpositionPosterScrollViewDelegate {
    func didTapShowKoreanExhibitButton(_ scrollView: UIScrollView) {
        let exhibitsViewController = ExhibitsViewController()
        exhibitsViewController.title = "한국의 출품작"
        navigationItem.backButtonTitle = "메인"
        self.navigationController?.pushViewController(exhibitsViewController, animated: true)
    }
}
