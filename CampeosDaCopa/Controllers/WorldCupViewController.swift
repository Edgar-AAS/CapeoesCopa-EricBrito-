//
//  WordCupViewController.swift
//  CampeosDaCopa
//
//  Created by Edgar Arlindo on 05/10/22.
//

import UIKit

class WorldCupViewController: UIViewController {
    var worldCup: WorldCup?
 
    @IBOutlet var ivWinner: UIImageView!
    @IBOutlet var ivVice: UIImageView!
    @IBOutlet var lbScore: UILabel!
    @IBOutlet var lbWinner: UILabel!
    @IBOutlet var lbVice: UILabel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        formatView()
    }
        
    private func formatView() {
        if let worldCup = worldCup {
            title = "WorldCup \(worldCup.year)"
            ivWinner.image = UIImage(named: "\(worldCup.winner).png")
            ivVice.image = UIImage(named: "\(worldCup.vice).png")
            lbWinner.text = worldCup.winner
            lbVice.text = worldCup.vice
            lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
        }
    }
}

extension WorldCupViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup?.matches.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup?.matches[section].games
        return games!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GamesTableViewCell else { return UITableViewCell() }
        let match = worldCup?.matches[indexPath.section]
        let game = match?.games[indexPath.row]
        cell.prepare(with: game!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let match = worldCup?.matches[section] else { return "" }
        return match.stage
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
}

