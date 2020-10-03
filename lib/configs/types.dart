const List<Map<String, dynamic>> types = [
  {
    "name": "Normal",
    "effects": {
      "2": [],
      "0": ["Ghost"],
      "0.5": ["Rock", "Steel"],
      "1": [
        "Normal",
        "Fighting",
        "Flying",
        "Poison",
        "Ground",
        "Bug",
        "Fire",
        "Water",
        "Grass",
        "Electric",
        "Psychic",
        "Ice",
        "Dragon",
        "Dark",
        "Fairy"
      ]
    }
  },
  {
    "name": "Fire",
    "effects": {
      "0.5": ["Rock", "Fire", "Water", "Dragon"],
      "1": [
        "Normal",
        "Fighting",
        "Flying",
        "Poison",
        "Ground",
        "Ghost",
        "Electric",
        "Psychic",
        "Dark",
        "Fairy"
      ],
      "2": ["Bug", "Steel", "Grass", "Ice"],
      "0": []
    }
  },
  {
    "name": "Water",
    "effects": {
      "0.5": ["Water", "Grass", "Dragon"],
      "2": ["Ground", "Rock", "Fire"],
      "1": [
        "Normal",
        "Fighting",
        "Flying",
        "Poison",
        "Bug",
        "Ghost",
        "Steel",
        "Electric",
        "Psychic",
        "Ice",
        "Dark",
        "Fairy"
      ],
      "0": []
    }
  },
  {
    "name": "Electric",
    "effects": {
      "0.5": ["Grass", "Electric", "Dragon"],
      "2": ["Flying", "Water"],
      "0": ["Ground"],
      "1": [
        "Normal",
        "Fighting",
        "Poison",
        "Rock",
        "Bug",
        "Ghost",
        "Steel",
        "Fire",
        "Psychic",
        "Ice",
        "Dark",
        "Fairy"
      ]
    }
  },
  {
    "name": "Grass",
    "effects": {
      "1": ["Normal", "Fighting", "Ghost", "Electric", "Psychic", "Ice", "Dark", "Fairy"],
      "0": [],
      "2": ["Ground", "Rock", "Water"],
      "0.5": ["Flying", "Poison", "Bug", "Steel", "Fire", "Grass", "Dragon"]
    }
  },
  {
    "name": "Ice",
    "effects": {
      "0.5": ["Steel", "Fire", "Water", "Ice"],
      "2": ["Flying", "Ground", "Grass", "Dragon"],
      "0": [],
      "1": [
        "Normal",
        "Fighting",
        "Poison",
        "Rock",
        "Bug",
        "Ghost",
        "Electric",
        "Psychic",
        "Dark",
        "Fairy"
      ]
    }
  },
  {
    "name": "Fighting",
    "effects": {
      "0.5": ["Flying", "Poison", "Bug", "Psychic", "Fairy"],
      "1": ["Fighting", "Ground", "Fire", "Water", "Grass", "Electric", "Dragon"],
      "2": ["Normal", "Rock", "Steel", "Ice", "Dark"],
      "0": ["Ghost"]
    }
  },
  {
    "name": "Poison",
    "effects": {
      "2": ["Grass", "Fairy"],
      "1": [
        "Normal",
        "Fighting",
        "Flying",
        "Bug",
        "Fire",
        "Water",
        "Electric",
        "Psychic",
        "Ice",
        "Dragon",
        "Dark"
      ],
      "0": ["Steel"],
      "0.5": ["Poison", "Ground", "Rock", "Ghost"]
    }
  },
  {
    "name": "Ground",
    "effects": {
      "0": ["Flying"],
      "1": [
        "Normal",
        "Fighting",
        "Ground",
        "Ghost",
        "Water",
        "Psychic",
        "Ice",
        "Dragon",
        "Dark",
        "Fairy"
      ],
      "2": ["Poison", "Rock", "Steel", "Fire", "Electric"],
      "0.5": ["Bug", "Grass"]
    }
  },
  {
    "name": "Flying",
    "effects": {
      "0.5": ["Rock", "Steel", "Electric"],
      "1": [
        "Normal",
        "Flying",
        "Poison",
        "Ground",
        "Ghost",
        "Fire",
        "Water",
        "Psychic",
        "Ice",
        "Dragon",
        "Dark",
        "Fairy"
      ],
      "2": ["Fighting", "Bug", "Grass"],
      "0": []
    }
  },
  {
    "name": "Psychic",
    "effects": {
      "0.5": ["Steel", "Psychic"],
      "2": ["Fighting", "Poison"],
      "0": ["Dark"],
      "1": [
        "Normal",
        "Flying",
        "Ground",
        "Rock",
        "Bug",
        "Ghost",
        "Fire",
        "Water",
        "Grass",
        "Electric",
        "Ice",
        "Dragon",
        "Fairy"
      ]
    }
  },
  {
    "name": "Bug",
    "effects": {
      "0": [],
      "2": ["Grass", "Psychic", "Dark"],
      "1": ["Normal", "Ground", "Rock", "Bug", "Water", "Electric", "Ice", "Dragon"],
      "0.5": ["Fighting", "Flying", "Poison", "Ghost", "Steel", "Fire", "Fairy"]
    }
  },
  {
    "name": "Rock",
    "effects": {
      "0": [],
      "2": ["Flying", "Bug", "Fire", "Ice"],
      "1": [
        "Normal",
        "Poison",
        "Rock",
        "Ghost",
        "Water",
        "Grass",
        "Electric",
        "Psychic",
        "Dragon",
        "Dark",
        "Fairy"
      ],
      "0.5": ["Fighting", "Ground", "Steel"]
    }
  },
  {
    "name": "Ghost",
    "effects": {
      "1": [
        "Fighting",
        "Flying",
        "Poison",
        "Ground",
        "Rock",
        "Bug",
        "Steel",
        "Fire",
        "Water",
        "Grass",
        "Electric",
        "Ice",
        "Dragon",
        "Fairy"
      ],
      "0.5": ["Dark"],
      "0": ["Normal"],
      "2": ["Ghost", "Psychic"]
    }
  },
  {
    "name": "Dragon",
    "effects": {
      "2": ["Dragon"],
      "0": ["Fairy"],
      "1": [
        "Normal",
        "Fighting",
        "Flying",
        "Poison",
        "Ground",
        "Rock",
        "Bug",
        "Ghost",
        "Fire",
        "Water",
        "Grass",
        "Electric",
        "Psychic",
        "Ice",
        "Dark"
      ],
      "0.5": ["Steel"]
    }
  },
  {
    "name": "Dark",
    "effects": {
      "2": ["Ghost", "Psychic"],
      "0": [],
      "1": [
        "Normal",
        "Flying",
        "Poison",
        "Ground",
        "Rock",
        "Bug",
        "Steel",
        "Fire",
        "Water",
        "Grass",
        "Electric",
        "Ice",
        "Dragon"
      ],
      "0.5": ["Fighting", "Dark", "Fairy"]
    }
  },
  {
    "name": "Steel",
    "effects": {
      "2": ["Rock", "Ice", "Fairy"],
      "1": [
        "Normal",
        "Fighting",
        "Flying",
        "Poison",
        "Ground",
        "Bug",
        "Ghost",
        "Grass",
        "Psychic",
        "Dragon",
        "Dark"
      ],
      "0": [],
      "0.5": ["Steel", "Fire", "Water", "Electric"]
    }
  },
  {
    "name": "Fairy",
    "effects": {
      "1": [
        "Normal",
        "Flying",
        "Ground",
        "Rock",
        "Bug",
        "Ghost",
        "Water",
        "Grass",
        "Electric",
        "Psychic",
        "Ice",
        "Fairy"
      ],
      "0.5": ["Poison", "Steel", "Fire"],
      "0": [],
      "2": ["Fighting", "Dragon", "Dark"]
    }
  }
];
