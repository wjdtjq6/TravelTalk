//
//  ChatSceneViewController.swift
//  TravelTalk
//
//  Created by t2023-m0032 on 6/4/24.
//

import UIKit
var chattingList: [Chat] = []

class ChatSceneViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let xib1 = UINib(nibName: "MychatTableViewCell", bundle: nil)
        tableView.register(xib1, forCellReuseIdentifier: "MychatTableViewCell")
        let xib2 = UINib(nibName: "OtherchatTableViewCell", bundle: nil)
        tableView.register(xib2, forCellReuseIdentifier: "OtherchatTableViewCell")
        
    }

}
extension ChatSceneViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
        //mockChatList[indexPath.row].chatList[indexPath.row].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if mockChatList[indexPath.row].chatList[indexPath.row].user == User.user {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MychatTableViewCell") as! MychatTableViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherchatTableViewCell") as! OtherchatTableViewCell
            return cell
        }
        
    }
    
    
}
