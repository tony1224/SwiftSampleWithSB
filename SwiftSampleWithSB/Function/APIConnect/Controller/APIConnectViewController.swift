//
//  APIConnectViewController.swift
//  SwiftSampleWithSB
//
//  Created by Morita Jun on 2018/03/21.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

// API通信のサンプル画面のViewControllerです。
// APIクライアントにCodableかSwiftyJSONを使用します。
class APIConnectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var pullToRefreshView: PullToRefreshView!
    private var refreshControl: UIRefreshControl = UIRefreshControl()
    private var timer: Timer?
    
    // Public
    // Codableを使った通信処理かどうかを判定
    var isCodable: Bool = false
    
    // MARK: - LifeCycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Table設定
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Setup
    private func setupTableView() {
        // 不要な罫線削除
        self.tableView.tableFooterView = UIView()
        
        // 引っ張って更新View
        self.refreshControl = UIRefreshControl()
        self.refreshControl.backgroundColor = .red
        self.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView.addSubview(self.refreshControl)
        
        self.pullToRefreshView.frame = self.refreshControl.bounds
        
        self.refreshControl.addSubview(self.pullToRefreshView)
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        self.pullToRefreshView.changeLabel(text: "離して更新！")
        
        // 通信開始
        self.doSomething()
        
        // 通信中に画像をアニメーション処理する
        self.pullToRefreshView.animateImage()
    }
    
    // TODO: 実際に通信するまでの暫定メソッド
    private func doSomething() {
        self.timer = Timer.scheduledTimer(timeInterval: 3,
                                         target: self,
                                         selector: #selector(timeUpdate),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    @objc func timeUpdate() {
        self.refreshControl.endRefreshing()
        self.timer = nil
    }
    
}

extension APIConnectViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44;
    }
    
}

extension APIConnectViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)番目のセルだよ"
        return cell
    }
    
}
