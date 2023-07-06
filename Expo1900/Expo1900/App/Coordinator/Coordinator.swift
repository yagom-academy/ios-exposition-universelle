//
//  Coordinator.swift
//  Expo1900
//
//  Created by Hyungmin Lee on 2023/07/06.
//
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
