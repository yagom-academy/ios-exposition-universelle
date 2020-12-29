import UIKit

class ViewController: UIViewController {
    
    var expositionPosterScrollView: ExpositionPosterScrollView?
    private lazy var expositionInformation: Exposition? = {
        if let data = NSDataAsset(name: "exposition_universelle_1900")?.data {
            do {
                let expositionInformation = try JSONDecoder().decode(Exposition.self,
                                                                     from: data)
                return expositionInformation
            } catch {
                return nil
            }
        }
        return nil
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = "메인"
        expositionPosterScrollView = ExpositionPosterScrollView()
        guard let expositionPosterScrollView = expositionPosterScrollView else {
            return
        }
        expositionPosterScrollView.expositionPosterScrollViewDelegate = self
        view.addSubview(expositionPosterScrollView)
        expositionPosterScrollView.configurePoster(with: expositionInformation)
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
}

extension ViewController: ExpositionPosterScrollViewDelegate {
    func didTapShowKoreanExhibitButton(_ scrollView: UIScrollView) {
        let exhibitsViewController = ExhibitsViewController()
        self.navigationController?.pushViewController(exhibitsViewController, animated: true)
    }
}
