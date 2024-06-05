//
//  ChatSceneViewController.swift
//  TravelTalk
//
//  Created by t2023-m0032 on 6/4/24.
//

import UIKit

//var titleList

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
        
        navigationItem.title = eachChatRoomName
        navigationController?.navigationItem.leftBarButtonItem?.image = UIImage(systemName: "lessthan")
        navigationController?.navigationItem.leftBarButtonItem?.title = ""
    }

}
extension ChatSceneViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //UITableView.automaticDimension
        100
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //mockChatList[indexPath.row].chatList.count
        return newList.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //if mockChatList[indexPath.row].chatList[indexPath.row].user == User.user {// 로 하면 out of index
        //왜냐! vc의 indexPath.row를 받아와야지 mockChatList[indexPath.row]를 받아오면 아예 다른 데이터임
        if newList[indexPath.row].user == User.user {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MychatTableViewCell") as! MychatTableViewCell
            cell.chatLabel.text = newList[indexPath.row].message
            
            //cell.dataLabel.text = newList[indexPath.row].date
            //String 타입으로 된 Date를 내가 원하는 형태로 변경하고자 할 때
            let dateStr = newList[indexPath.row].date // Date 형태의 String
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // 2020-08-13 16:30
            
            let convertDate = dateFormatter.date(from: dateStr) // date타입으로 변환
            
            let myDateFormatter = DateFormatter()
            myDateFormatter.dateFormat = "hh:mm a" // 04:30 PM
            myDateFormatter.locale = Locale(identifier:"ko_KR")
            let convertStr = myDateFormatter.string(from: convertDate!)
            
            cell.dataLabel.text = convertStr
            //String 타입으로 된 Date를 내가 원하는 형태로 변경하고자 할 때
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherchatTableViewCell") as! OtherchatTableViewCell
            cell.profileImageView.image = UIImage(named: newList[indexPath.row].user.profileImage)
            cell.nameLabel.text = newList[indexPath.row].user.rawValue
            cell.chatLabel.text = newList[indexPath.row].message
            print(newList[indexPath.row].user.profileImage)
            print(newList[indexPath.row].user.rawValue)
            
            // newlist: [Chat]
            // newlist[n]: Chat
            // newlist[n]. user: User, date: String, message: String
            // newlist[n].user: User
            // newlist[n].user.profileImage: String
            
            
            //cell.dataLabel.text = newList[indexPath.row].date
            //String 타입으로 된 Date를 내가 원하는 형태로 변경하고자 할 때
            let dateStr = newList[indexPath.row].date // Date 형태의 String
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // 2020-08-13 16:30
            
            let convertDate = dateFormatter.date(from: dateStr) // date타입으로 변환
            
            let myDateFormatter = DateFormatter()
            myDateFormatter.dateFormat = "hh:mm a" // 04:30 PM
            myDateFormatter.locale = Locale(identifier:"ko_KR")
            let convertStr = myDateFormatter.string(from: convertDate!)
            
            cell.dataLabel.text = convertStr
            //String 타입으로 된 Date를 내가 원하는 형태로 변경하고자 할 때
            return cell
        }
        
    }
}
