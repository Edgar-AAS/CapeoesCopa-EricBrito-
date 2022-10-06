//
//  GamesTableViewCell.swift
//  CampeosDaCopa
//
//  Created by Edgar Arlindo on 06/10/22.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    @IBOutlet var ivHome: UIImageView!
    @IBOutlet var ivAway: UIImageView!
    @IBOutlet var lbHome: UILabel!
    @IBOutlet var lbAway: UILabel!
    @IBOutlet var lbScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(with game: Game) {
        ivHome.image = UIImage(named: "\(game.home).png")
        ivAway.image = UIImage(named: "\(game.away).png")
        lbHome.text = game.home
        lbAway.text = game.away
        lbScore.text = game.score
    }
}
