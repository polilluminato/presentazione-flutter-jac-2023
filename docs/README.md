# Appunti 

Il punto da cui parte l'applicazione è il file `lib/main.dart` che contiene il codice per l'inizializzazione della app e l'invocazione del vero e proprio codice della app che sta in `app/app.dart`.

```dart
...
import 'package:flutter_jac/app/app.dart';

   ...
   runApp(
      ProviderScope(
         child: App(),
      ),
   );
   ...
```

All'interno del file `app.dart` c'è la definizione del routing dell'applicazione e delle impostazioni della applicazioni in termini di tema con l'oggetto `ThemeData`.

## Home Page

Nel file `home_page.dart` c'è il codice della pagina principale dell'applicazione. Possiamo modificare il titolo della pagina andando ad agire sulla parte di `AppBar` e le sue proprietà

```dart
appBar: AppBar(
   centerTitle: true,
   title: const Text(
      "Flutter Demo @ Jac",
   ),
   actions: [
      Padding(
         padding: const EdgeInsets.only(right: 8),
         child: IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
         ),
      )
   ],
),
```

### Splash Tab

Aggiungiamo un `Column` per disporre i nostri contenuti uno sotto l'altro 

```dart
return Center(
   child: Column(
      children: [
         Image.asset(
            "assets/images/splash.png",
            width: ScreenUtils.getScreenWidth(context) * .7,
         ),
         Padding(
            padding: const EdgeInsets.only(bottom: 24, top: 48),
            child: Text(
               "Jobs Academy App",
               style: textTheme.headlineMedium,
            ),
         ),
         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
               "JAC Offre percorsi nell'ambito dell'istruzione post-diploma"
               " per formare tecnici specializzati in ambito Business, Tecnologico,"
               " ICT, Marketing e Green.",
               textAlign: TextAlign.center,
               style: textTheme.bodyMedium,
            ),
         ),
         Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
               onPressed: () {},
               child: const Text("Benvenuti"),
            ),
         )
      ],
   )
);
```

### Pokemon Tab

E' stata creata una classe `PokemonItem` con cui rappresentare un Pokémon e le sue informazioni nel file `models/pokemon_item.dart`

```dart
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
    imageLink =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }
}
```

In questa tab possiamo visualizzazione una lista di Pokémon presi per comodità dal file `data/pokemon_list.dart` e visualizzarli all'interno della pagna con un `ListView.builder` che visualizza tutti i nostri Pokémon all'interno di una lista

```dart
return ListView.builder(
   itemCount: pokemonList.length,
   itemBuilder: (context, index) {
      PokemonItem myPokemon = pokemonList[index];

      //Lista semplice con solo il nome del Pokemon
      //return Text(myPokemon.name);

      //Lista graficata con la classe
      //return PokemonRow(myPokemon: myPokemon);
   },
);
```

Per migliorare la UI possiamo creare un widget personalizzato, chiamato `PokemonRow` con cui creare la nostra riga

```dart
class PokemonRow extends StatelessWidget {
  const PokemonRow({super.key, required this.myPokemon});

  final PokemonItem myPokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        onTap: () {
          debugPrint(myPokemon.name);
          context.push(
            '/pokemon/single',
            extra: myPokemon,
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(myPokemon.imageLink ?? ""),
        ),
        title: Text(myPokemon.name),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
```

### Single Pokémon

All'interno di questa pagina possiamo far vedere maggiori informazioni su un singolo Pokémon andando a fare una chiamata HTTP alle API di Pokèmon attraverso il `PokemonRepository` e il suo metodo `getSinglePokemon(int id)` che ci tornerà un oggetto `Pokemon` che possiamo visualizzare all'interno della pagina. Anche in questo caso possiamo rendere la UI più bella in questo modo

```dart
return Column(
   children: [
      Image.network(
         myPokemon.imageLink,
         width: ScreenUtils.getScreenWidth(context) * .5,
      ),
      Text(
         myPokemon.name,
         style: textTheme.displaySmall,
      ),
      Card(
         margin:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
         child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                     children: [
                        Text(
                           "${myPokemon.weight}",
                           style: textTheme.headlineMedium,
                        ),
                        Text(
                           "Weight",
                           style: textTheme.bodyMedium,
                        )
                     ],
                  ),
               ),
               Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                     children: [
                        Text(
                           "${myPokemon.height}",
                           style: textTheme.headlineMedium,
                        ),
                        Text(
                           "Height",
                           style: textTheme.bodyMedium,
                        )
                     ],
                  ),
               ),
            ],
         ),
      )
   ],
);
```

### Bottom Navigation

Per abilitare la navigazione all'interno dell'applicazione è sufficiente importare la tabList che sta nel file `data/tab_list.dart` 

```dart
import 'package:flutter_jac/data/tab_list.dart';
```

Cambiare il `body` nello `Scaffold` in modo da leggere la tabList e il contenuto di una singola tab

```dart
body: tabList[ref.watch(indexTabProvider)].content,
```

Aggiungere quindi la parte per la `bottomNavigationBar` nello `Scaffold`

```dart
bottomNavigationBar: NavigationBar(
   onDestinationSelected: (int index) {
      ref.read(indexTabProvider.notifier).state = index;
   },
   selectedIndex: ref.watch(indexTabProvider),
   destinations: tabList
      .map(
         (singleScreenTab) => NavigationDestination(
            icon: Icon(singleScreenTab.icon),
            label: singleScreenTab.label,
         ),
      )
      .toList(),
),
```

Aggiungiamo anche altre pagina alla nostra `NavigationBar` 

```dart
final List<ScreenTab> tabList = [
  ...
  ScreenTab(
    label: "News",
    icon: Icons.list_alt,
    content: const NewsListTab(),
  ),
  ScreenTab(
    label: "Gallery",
    icon: Icons.grid_view,
    content: const GalleryTab(),
  ),
  ScreenTab(
    label: "Location",
    icon: Icons.location_on_outlined,
    content: const IpLocationTab(),
  ),
];

```

