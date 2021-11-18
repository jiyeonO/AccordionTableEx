//
//  ViewController.swift
//  3.0_AccordionTable
//
//  Created by 오지연 on 2021/06/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedSectionIdx = -1
    
    let menuTitles = ["홈", "커리큘럼", "미션", "커뮤니티", "학습 리포트", "홈", "커리큘럼", "미션", "커뮤니티", "학습 리포트"]
    
    let sectionTitles = ["LV1 코스", "LV2 코스", "LV3 코스", "LV4 코스", "LV5 코스", "LV6 코스", "LV7 코스"]
    
    let rowTitles = ["강의1", "강의2", "강의3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // CollectionView Option
        let cellSize = CGSize(width:150, height:52)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.reloadData()
        
        // tableView
        // Style plain 인 경우, Header가 스크롤 해도 남아있음
        // style group 일 경우, Header 남아있는 현상은 없지만
        // 의도하지 않은 footer가 모든 Section 마다 존재
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.sectionFooterHeight = 0
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCollectionViewCell {
            cell.setCellItem(text: menuTitles[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == selectedSectionIdx {
            return rowTitles.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell") as? RowTableViewCell {
            cell.setCellItem(text: rowTitles[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as? SectionTableViewCell {
            cell.setCellItem(text: sectionTitles[section], index: section)
            cell.delegate = self
            return cell
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
}

extension ViewController: SectionExpandableDelegate {
    func sectionExpandable(sectionIdx: Int) {
        selectedSectionIdx = selectedSectionIdx == sectionIdx ? -1 : sectionIdx
        tableView.reloadData()
    }
}
