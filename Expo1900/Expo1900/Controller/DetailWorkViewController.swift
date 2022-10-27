//
//  DetailWorkViewContorller.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/20.
//
import UIKit

final class DetailWorkViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        return imageView
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.adjustsFontForContentSizeCategory = true
        
        return textView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
        
    lazy var scrollView = UIScrollView()
    
    lazy var contentView = UIView()
    
    var exhibitionWork: ExhibitionWork?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
}
