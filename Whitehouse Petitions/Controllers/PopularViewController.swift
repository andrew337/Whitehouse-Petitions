//
//  PopularViewController.swift
//  Whitehouse Petitions
//
//  Created by Admin on 7/7/22.
//

import UIKit

class PopularViewController: UIViewController {

    var petitions = [Petition]()
    let urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
    
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(PetitionTableViewCell.self, forCellReuseIdentifier: PetitionTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .systemBackground
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        NetworkManager.shared.getPetitions(urlString: urlString) { [weak self] petitionsArr in
            DispatchQueue.main.async {
                self?.petitions = petitionsArr.results
                self?.tableView.reloadData()
            }
            
        }
    }
}

extension PopularViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PetitionTableViewCell else { return UITableViewCell()}
        cell.title.text = petitions[indexPath.row].title
        cell.subtitle.text = petitions[indexPath.row].body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

