/// The pokemon
class Pokemon {
  const Pokemon({
    required this.number,
    required this.name,
    required this.portrait,
    required this.types,
  });

  final String number;
  final String name;
  final String portrait;
  final Set<String> types;
}
