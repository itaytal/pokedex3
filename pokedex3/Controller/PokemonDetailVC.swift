//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Globes Design on 20/11/2018.
//  Copyright © 2018 Globes Design. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

      var pokemon: Pokemon!
    
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var typelbl: UILabel!
    @IBOutlet weak var pokeImg: UIImageView!
    @IBOutlet weak var descriptionlbl: UILabel!
    @IBOutlet weak var defencelbl: UILabel!
    @IBOutlet weak var heightlbl: UILabel!
    @IBOutlet weak var idlbl: UILabel!
    @IBOutlet weak var weightlbl: UILabel!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var attacklbl: UILabel!
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pokemonName.text = pokemon.name
        
        pokemon.downloadPokemonDetails {
        
            self.UpdateUI()
        }
        
    }
    
    func UpdateUI(){
        
        
        print(pokemon.attack)
        print(pokemon.defence)
        print(pokemon.weight)
        
        idlbl.text = "\(pokemon.pokedexId)"
        attacklbl.text = pokemon.attack
        defencelbl.text = pokemon.defence
        heightlbl.text = pokemon.height
        weightlbl.text = pokemon.weight
        
    }
    
    @IBAction func btnPress(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
