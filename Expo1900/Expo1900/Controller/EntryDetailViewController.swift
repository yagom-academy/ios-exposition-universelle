//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by 유재호 on 2021/12/09.
//

import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var entryImage: UIImageView!
    @IBOutlet private weak var entryDescriptionLabel: UILabel!
    
    var entry: KoreanEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        setEntryDescriptionLabel()
        setEntryImage()
        setImageAccessibilityHint()
    }
    
    private func setNavigationBarTitle() {
        navigationItem.title = entry?.name
    }
    
    private func setEntryDescriptionLabel() {
        entryDescriptionLabel.text = entry?.description
    }
    
    private func setEntryImage() {
        guard let imageName = entry?.imageName else {
            return
        }
        entryImage.image = UIImage(named: imageName)
    }
    
    private func setImageAccessibilityHint() {
        var imageHint: String {
            switch entry?.imageName {
            case "jikji":
                return "빛바랜 옛날 종이에 한문이 많이 쓰여있어요."
            case "buddhism":
                return "로마 시대 마차의 바퀴 같은 불교의 문양이 보여요."
            case "palman":
                return "거대한 나무 책장에 고문서들이 아주 많이 진열되어있어요."
            case "samguk":
                return "빛바랜 옛날 종이에 드문드문 한문이 쓰여있어요."
            case "haegeum":
                return "오래된 바이올린과 비슷하게 생겼지만 한국적인 개성을 관찰할 수 있어요."
            case "ywoonggo":
                return "태극 문양과 승천하는 용이 그려진 북이 보여요."
            case "bangjja":
                return "금색빛이 예쁜 놋그릇이 정갈하게 놓여 있어요."
            case "woodshoes":
                return "나무를 조각해서 만든 듯한 작은 신발이 보여요."
            case "najeon":
                return "오묘한 빛을 내는 나전으로 장식한 팔각형의 상자가 보여요."
            case "folds":
                return "아늑한 방의 벽면에 화려한 꽃이 그려진 병풍이 자리잡고 있어요."
            case "god":
                return "촘촘하고 튼튼하게 만들어진 검정색 갓이 보여요."
            case "gayageum":
                return "기다란 원목 판자 위에 소리를 낼 수 있는 줄이 촘촘하게 걸려있어요."
            case "geomungo":
                return "기다란 원목 판자 위에 소리를 낼 수 있는 줄이 듬성듬성 걸려있어요."
            default:
                return "이미지가 없어요."
            }
        }
        entryImage.accessibilityHint = imageHint
    }
}
