import 'package:flutter_recruitment_task/repositories/products_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockProductsRepository extends Mock implements ProductsRepository {}

const mockedProductJson = '''
{
    "id": "918",
    "name": "Woda mineralna Cisowianka Perlage PET 700 ml",
    "description": "",
    "available": true,
    "offer": {
      "sellerId": "seller347",
      "sellerName": "seller347",
      "skuId": "10921",
      "regularPrice": {
        "amount": 2.4,
        "currency": "PLN"
      },
      "promotionalPrice": {
        "amount": 1.99,
        "currency": "PLN"
      },
      "normalizedPrice": {
        "amount": 3.43,
        "currency": "PLN",
        "unitLabel": "/l"
      },
      "promotionalNormalizedPrice": {
        "amount": 2.84,
        "currency": "PLN",
        "unitLabel": "/l"
      },
      "omnibusFrom": "2023-01-22",
      "omnibusPrice": {
        "amount": 2.4,
        "currency": "PLN"
      },
      "omnibusLabel": "Najniższa cena od wprowadzenia towaru",
      "isBest": false,
      "isSponsored": false,
      "subtitle": ""
    },
    "mainImage": "",
    "tags": [
      {
        "color": "#EC0677",
        "label": "%",
        "tag": "promotion",
        "labelColor": "#FFFFFF"
      }
    ],
    "sellerId": "seller347",
    "isFavorite": false,
    "isBlurred": false
  }
''';

const String mockedProductBestJson = '''
 {
      "id": "16",
      "name": "MK Cafe Premium Kawa mielona  50 0 g",
      "description": "",
      "available": true,
      "offer": {
        "sellerId": "seller646",
        "sellerName": "seller646",
        "skuId": "10016",
        "regularPrice": {
          "amount": 22,
          "currency": "PLN"
        },
        "normalizedPrice": {
          "amount": 22,
          "currency": "PLN",
          "normalizedUnit": "piece",
          "unitLabel": "/g"
        },
        "isBest": true,
        "isSponsored": false,
        "subtitle": ""
      },
      "mainImage": "",
      "tags": [
        {
          "color": "#00A42E",
          "gradient": {
            "colors": [
              "#FFCB04",
              "#00A42E"
            ],
            "stops": [
              0,
              0.8
            ],
            "begin": [
              -1,
              -1
            ],
            "end": [
              1,
              1
            ]
          },
          "label": "BEST",
          "tag": "best",
          "labelColor": "#FFFFFF",
          "position": "image-up-left"
        }
      ],
      "sellerId": "seller646",
      "isFavourite": false,
      "isBlurred": true,
      "variablePrice": false
    }
''';
