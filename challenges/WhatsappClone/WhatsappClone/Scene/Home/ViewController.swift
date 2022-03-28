//
//  ViewController.swift
//  WhatsappClone
//
//  Created by Idwall Go Dev 013 on 25/03/22.
//


import UIKit

class ViewController: UIViewController {
    
    lazy var tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var messages = [Message]() {
        didSet {
            DispatchQueue.main.sync {
                tableview.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let addLeftButton = UIBarButtonItem(title: "Edit", style: .plain, target: nil, action: nil)
        let addRightButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: nil, action: nil)
        
        navigationItem.leftBarButtonItems = [addLeftButton]
        navigationItem.rightBarButtonItems = [addRightButton]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chats"
        
        view.backgroundColor = .white
        
        view.addSubview(tableview)
        
        tableview.delegate = self
        tableview.dataSource = self
        getFriends()
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
    }
    
    private func configureHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        
        lazy var leftHeaderLabel: UILabel = {
            let label = UILabel()
            label.textColor = .systemGray
            label.contentMode = .left
            label.font = UIFont.systemFont(ofSize: 14)
            label.text = "Broadcast List"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var rightHeaderLabel: UILabel = {
            let label = UILabel()
            label.textColor = .systemGray
            label.contentMode = .right
            label.font = UIFont.systemFont(ofSize: 14)
            label.text = "New Group"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        

        //header.addSubview(UIImageView(image: UIImage(systemName: "house")!))
        
        header.addSubview(leftHeaderLabel)
        header.addSubview(rightHeaderLabel)
        tableview.tableHeaderView = header
    }
    
    private func getFriends() {
        Service.shared.getFriends { result in
            
            switch result {
            case .success(let res):
                self.messages = res
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secoundViewController = SecoundViewController()
        secoundViewController.modalPresentationStyle = .fullScreen
        
        if let _ = navigationController {
            navigationController?.present(secoundViewController, animated: true)
        }
        
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let friendMessage = messages[indexPath.row]
        
        cell.setup(with: friendMessage)
        return cell
    }
    
    
}

