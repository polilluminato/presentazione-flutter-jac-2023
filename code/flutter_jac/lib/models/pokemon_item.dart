class PokemonItem {
  String name;
  String link;
  int? id;
  String? imageLink;

  PokemonItem(this.name, this.link) {
    final splittedLink = link.split('/');
    id = int.parse(splittedLink[splittedLink.length - 2]);

    name = name[0].toUpperCase() + name.substring(1).toLowerCase();

    imageLink =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }
}
