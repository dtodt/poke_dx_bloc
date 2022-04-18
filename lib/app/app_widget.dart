import 'package:flutter/material.dart';
import 'package:pokedx/app/core/core_module.dart';
import 'package:pokedx/app/core/presentation/helpers/page_transitions_helper.dart';
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
          brightness: Brightness.dark,
          pageTransitionsTheme: PageTransitionsHelper(),
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        themeMode: ThemeMode.dark,
        home: const PokemonListPage(),
      ),
      providers: [
        ...coreModule,
        ...pokedexModule,
      ],
    );
  }
}
