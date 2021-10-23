//
//  TableViewPracticeViewController.swift
//  29th-iOS-SeminarPractice-week3
//
//  Created by kimhyungyu on 2021/10/23.
//

import UIKit

class TableViewPracticeViewController: UIViewController {

    // MARK: - Properties
    
    private var appContentList = [AppContentData]()
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegate()
        registerXib()
        initAppContentList()
    }
}

// MARK: - Extensions

extension TableViewPracticeViewController {
    
    private func assignDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerXib() {
        let nib = UINib(nibName: PracticeTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PracticeTableViewCell.identifier)
    }
    
    func initAppContentList(){
            appContentList.append(contentsOf: [
                AppContentData(appName: "질병관리청",description: "전자예방접종증명서",appIconName: "coovIcon"),
                AppContentData(appName: "카카오톡", description: "소셜 네트워킹", appIconName: "kakaoIcon"),
                AppContentData(appName: "YouTube", description: "동영상과 음악", appIconName: "youtubeIcon"),
                AppContentData(appName: "네이버", description: "검색과 콘텐츠, 쇼핑, 내도구", appIconName: "naverIcon"),
                AppContentData(appName: "Instagram", description: "사진 및 비디오", appIconName: "instagramIcon"),
                AppContentData(appName: "쿠팡", description: "스마트한 쇼핑", appIconName: "coupangIcon"),
                AppContentData(appName: "배달의 민족", description: "대한민국 1등 배달앱", appIconName: "baeminIcon"),
                AppContentData(appName: "당근마켓", description: "중고거래", appIconName: "karrotIcon"),
                AppContentData(appName: "Netflix", description: "지금 바로 시청하세요", appIconName: "netflixIcon"),
                AppContentData(appName: "무신사", description: "브랜드 패션 쇼핑", appIconName: "musinsaIcon")
            ])
        }
}

// MARK: - UITableViewDelegate

extension TableViewPracticeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

// MARK: -UITableViewDataSource

extension TableViewPracticeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PracticeTableViewCell.identifier, for: indexPath) as? PracticeTableViewCell else { return UITableViewCell() }
        cell.setData(rank: indexPath.row + 1, appData: appContentList[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension TableViewPracticeViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension TableViewPracticeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PracticeCollectionViewCell.identifier, for: indexPath) as? PracticeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setData(appName: appContentList[indexPath.item].appName, appImage: appContentList[indexPath.item].makeImage())
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension TableViewPracticeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = collectionView.frame.height
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}
