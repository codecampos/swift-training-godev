//
//  ViewController.swift
//  App
//
//  Created by Idwall Go Dev 013 on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    lazy var persons = [Person]() {
        didSet {
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegates()
        registerCell()
        getPersons()
        
    }
    
    private func delegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getPersons() {
        Service.shared.getPersons { result in
            
            switch result {
            case .success(let res):
                self.persons = res
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func registerCell() {
        let nib = UINib(nibName: PersonTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
    
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell else { return UITableViewCell()}
        
        
        let person = persons[indexPath.row]
        
        cell.setup(photo: person.photo, name: person.name, company: person.company.name)
        return cell
    }
}

