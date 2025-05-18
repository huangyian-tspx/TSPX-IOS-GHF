//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Huang Yi An on 14/5/25.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!
    var followers: [FollowerModel] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, FollowerModel>!
    
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        configCollectionView()
        configGetFollowers()
        configDatasourceForCell()
    }
    
    private func configViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configGetFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) {[weak self] result in
            guard let self = self else { return }
            switch result {
                
            case.success(let followers):
                self.followers = followers
                self.updateData()
                print(followers)
                
            case.failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", body: error.rawValue, titleButton: "Ok")
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configCollectionView() {
        collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout: GFUIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(GFFollowersCell.self, forCellWithReuseIdentifier: GFFollowersCell.reusedID)
    }
    
    private func configDatasourceForCell() {
        dataSource = UICollectionViewDiffableDataSource<Section, FollowerModel>(collectionView: collectionView, cellProvider: { collectionView, indexPath, followers in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowersCell.reusedID, for: indexPath) as! GFFollowersCell
            cell.setData(follower: followers)
            return cell
        })
    }
    
    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, FollowerModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }

}
