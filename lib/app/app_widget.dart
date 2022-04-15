import 'package:flutter/material.dart';
import 'package:pokedx/app/core/core_module.dart';
import 'package:pokedx/app/pokedex/pokedex_module.dart';
import 'package:pokedx/app/pokedex/presentation/pages/pokemon_list_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Poke DX',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const PokemonListPage(),
      ),
      providers: [
        ...coreModule,
        ...pokedexModule,
      ],
    );
  }
}
