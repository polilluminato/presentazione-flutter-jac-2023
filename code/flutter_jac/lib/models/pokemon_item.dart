class PokemonItem {
  String name;
  String link;
  int? id;
  String? imageLink;

  PokemonItem(this.name, this.link) {
    //Link fatto come https://pokeapi.co/api/v2/pokemon/{id}/
    //  vado a prenderne id alla fine
    final splittedLink = link.split('/');
    id = int.parse(splittedLink[splittedLink.length - 2]);

    //I nomi mi arrivano tutti in lowercase, in questo modo metto la prima
    //  lettera maiuscola: bulbasaur -> Bulbasaur
    name = name[0].toUpperCase() + name.substring(1).toLowerCase();

    //Basandosi sull'API per il singolo pokemon l'immagine può essere ottenuta
    //  componendo il link in questo modo:
    //  - https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{id}.png
    imageLink =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }
}
