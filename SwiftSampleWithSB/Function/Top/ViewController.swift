//
//  ViewController.swift
//  SwiftSampleWithSB
//
//  Created by Morita Jun on 2018/03/21.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // Private
    private var itemList: [String] = []
    // TODO: このenumから要素数, 文言をtableメソッドで返せるような仕組み
    //       switchでdefaultは使いたくない
//    private enum ItemName: String {
//        case apiConnection = "API Connection"
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar(title: "SwiftSample")
        self.tableView.setup()

        self.itemList = ["API Connection"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            // API通信サンプル画面
            let vc = APIConnectViewController.instantiate(withStoryboard: "APIConnect")
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TopCell.self, for: indexPath)
        let title = self.itemList[indexPath.row]
        cell.setData(title: title)
        return cell
    }
    
}
