//
//  SecondViewController.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 22.04.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var rocketName: String?
    var rocketId: String?
    var launches: [Launch] = []
    
    //MARK: - Content
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .black
        table.register(LaunchCell.self, forCellReuseIdentifier: "LaunchCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    //MARK: - Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupLayout()
        if let rocketId = rocketId {
            fetchLaunches(named: rocketId)
        }
    }
    
    
    
    //MARK: - Intents
    func setupLayout() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        if let rocketName = rocketName {
            navigationItem.title = rocketName
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
    }
    
    private func fetchLaunches(named rocketId: String) {
            NetworkManager.shared.getLaunch { [weak self] result in
                switch result {
                case .success(let launches):
                    print("Total launches: \(launches.count)")
                    self?.launches = launches.filter { $0.rocket.rawValue == rocketId }
                    print("Filtered launches: \(self?.launches.count ?? 0)")
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchCell", for: indexPath) as? LaunchCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .black
        let launch = launches[indexPath.row]
        cell.configure(launch: launch)
        cell.selectedBackgroundView?.isHidden = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
