# Poke DX

A clean Pokedex experience with Flutter.

> Check it live: [site]

## Setup the project

```sh
# download the deps
flutter pub get
# rename the file lib/firebase_options_template.dart
mv lib/firebase_options_template.dart lib/firebase_options.dart
# fill the environment information of each platform in `lib/firebase_options.dart` with your own firebase project options
```

## Tests

```sh
# run the tests
flutter test
# run the tests with coverage
flutter test --coverage
# generate html reports for coverage
genhtml ./coverage/lcov.info -o coverage/html
```

## References

- [Saepul Nahwan] with [Pokedex App design]

[site]: https://poke-dx.web.app/
[saepul nahwan]: https://dribbble.com/saepulnahwan23
[pokedex app design]: https://dribbble.com/shots/6545819-Pokedex-App
