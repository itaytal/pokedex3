//
//  Pokemon.swift
//  pokedex3
//
//  Created by Globes Design on 15/11/2018.
//  Copyright © 2018 Globes Design. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name :String!
    private var _pokedexId: Int!
    private var _decription: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolution: String!
    
    
    private var _pokemonURL:String!
    
    var name: String {
        return _name
    }
    
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var weight: String {
        if _weight == nil {
         _weight = ""
        }
        return _weight
    }
    var height: String{
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var defence: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var nextEvo: String {
        if _nextEvolution == nil {
            _nextEvolution = ""
        }
        return _nextEvolution
    }
    
    var description: String {
        if _decription == nil{
            _decription = ""
        }
        return _decription
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    
    
    
    
    init (name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        
    }
    
    func downloadPokemonDetails(complete: @escaping DownloadComplete){
        
        Alamofire.request(_pokemonURL, method: .get).responseJSON { response in
            
            
            if let dict = response.result.value as? Dictionary<String,AnyObject> {
                
                
                print(dict)
                
                if let id = dict["id"] as? Int {
                    self._pokedexId = id
                }
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let defence = dict["defence"] as? Int {
                    self._defense = "\(defence)"
                }
                
                print(self._defense)
                print(self._attack)
                print(self.weight)
                
            }
        complete()
        
        }
    }
    
}
