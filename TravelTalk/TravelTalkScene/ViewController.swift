//
//  ViewController.swift
//  TravelTalk
//
//  Created by t2023-m0032 on 6/4/24.
//

import UIKit
import Kingfisher
/*
 1.tableview 아웃렛 선언
 2.tableview 부하직원 선언 : protocol
 3.table와 부하직원 연결 : 타입으로서의 protocol
 4.XIB Cell: 여러 테이블에 재사용
 5.XIB register 해야함
 */

class ViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let xib1 = UINib(nibName: "ChattingTableViewCell", bundle: nil)
        tableView.register(xib1, forCellReuseIdentifier: "ChattingTableViewCell")
        let xib2 = UINib(nibName: "Chatting2TableViewCell", bundle: nil)
        tableView.register(xib2, forCellReuseIdentifier: "Chatting2TableViewCell")
        
        tableView.rowHeight = 100
        navigationItem.title = "TRAVEL TALK"
        
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatList.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //2.스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = storyboard?.instantiateViewController(identifier: "ChatSceneViewController") as! ChatSceneViewController
        //3.회면 띄우기
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if mockChatList[indexPath.row].chatroomImage.count == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Chatting2TableViewCell", for: indexPath) as! Chatting2TableViewCell
            
            for i in 0...mockChatList[indexPath.row].chatroomImage.count-1 {
                cell.profileImageView[i].image = UIImage(named: mockChatList[indexPath.row].chatroomImage[i])
                cell.profileImageView[i].layer.cornerRadius = 20
            }
            cell.nameLabel.text = mockChatList[indexPath.row].chatroomName
            cell.nameLabel.font = .boldSystemFont(ofSize: 14)
            
            cell.chatLabel.text = mockChatList[indexPath.row].chatList.last?.message
            cell.chatLabel.font = .systemFont(ofSize: 14)
            
            //String 타입으로 된 Date를 내가 원하는 형태로 변경하고자 할 때
            let dateStr = mockChatList[indexPath.row].chatList.last?.date // Date 형태의 String
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // 2020-08-13 16:30
            
            let convertDate = dateFormatter.date(from: dateStr!) // date타입으로 변환
           
            let myDateFormatter = DateFormatter()
            myDateFormatter.dateFormat = "yy.MM.dd" // 20.08.13
            let convertStr = myDateFormatter.string(from: convertDate!)
            
            cell.dateLabel.text = convertStr
            //String 타입으로 된 Date를 내가 원하는 형태로 변경하고자 할 때
            
            cell.dateLabel.font = .systemFont(ofSize: 14)

            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingTableViewCell", for: indexPath) as! ChattingTableViewCell
            
            cell.profileImageView.image = UIImage(named: mockChatList[indexPath.row].chatroomImage[0])
            cell.profileImageView.layer.cornerRadius = 40
            
            cell.nameLabel.text = mockChatList[indexPath.row].chatroomName
            cell.nameLabel.font = .boldSystemFont(ofSize: 14)
            
            cell.chatLabel.text = mockChatList[indexPath.row].chatList.last?.message
            cell.chatLabel.font = .systemFont(ofSize: 14)
            
            //String 타입으로 된 Date를 내가 원하는 형태로 변경하고자 할 때
            let dateStr = mockChatList[indexPath.row].chatList.last?.date // Date 형태의 String
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // 2020-08-13 16:30
            
            let convertDate = dateFormatter.date(from: dateStr!) // date타입으로 변환
           
            let myDateFormatter = DateFormatter()
            myDateFormatter.dateFormat = "yy.MM.dd" // 20.08.13
            let convertStr = myDateFormatter.string(from: convertDate!)
            
            cell.dateLabel.text = convertStr
            //String 타입으로 된 Date를 내가 원하는 형태로 변경하고자 할 때
            
            cell.dateLabel.font = .systemFont(ofSize: 14)
            
            return cell
        }
    }
}
