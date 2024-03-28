
# Fuel Blockchain Dart Client

![Pub Version](https://img.shields.io/pub/v/fuel_api)
![GitHub](https://img.shields.io/github/license/kelecorix/fuel-dart-client)
[![Tests](https://github.com/kelecorix/fuel-dart-client/actions/workflows/dart.yml/badge.svg)](https://github.com/kompendium-ano/fuel-dart-client/actions/workflows/dart.yml)

Dart client for [Fuel](https://fuel.network/) blockchain, a modern blockchain created as an operating system 
for Ethereum rollups. Fuel allows rollups to solve for PSI (parallelization, state minimized execution, interoperability) without making any sacrifices.

This library supports all [API](https://docs.fuel.network/docs/intro/glossary/) class and basic data types that reflect network types and structures and utility functions to ease up creation of specific requests.

## Installation

With Dart:
```
$ dart pub add fuel_api
```

With Flutter:
```
$ flutter pub add fuel_api
```

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```
dependencies:
  fuel_api: any
```
Alternatively, your editor might support dart pub get or flutter pub get. Check the docs for your editor to learn more.
Import it

Now in your Dart code, you can use:
```
import 'package:fuel_api/fuel_api.dart';
```

## Usage
See [examples](EXAMPLE.md) on how to use library.

## Contributions
This library developed by [Kelecorix, Inc](https://github.com/kelecorix). Contributions are welcome, open new PR or submit new issue.


