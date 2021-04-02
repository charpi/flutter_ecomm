import 'package:flutter/material.dart';
import 'package:flutter_ecomm/widget/product_tile.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

List<Story> productTileStories(BuildContext context) {
  return [
    Story(
        section: 'ProductTile',
        name: 'Basic Tile',
        builder: (_, k) {
          return ProductTile(
            id: '0',
            photoURL:
                'https://i5.walmartimages.com/asr/3656689e-71ac-4517-80be-c0cc700e9f80.130d12bcb99aa3b467669a393ddc5ebd.jpeg?odnWidth=408&odnHeight=408&odnBg=ffffff',
            price: 8.97,
            title: 'Pampers',
          );
        }),
    Story(
        section: 'ProductTile',
        name: 'Tile with Click',
        builder: (ctx, k) {
          return ProductTile(
            id: '0',
            photoURL:
                'https://i5.walmartimages.com/asr/3656689e-71ac-4517-80be-c0cc700e9f80.130d12bcb99aa3b467669a393ddc5ebd.jpeg?odnWidth=408&odnHeight=408&odnBg=ffffff',
            price: 8.97,
            title: 'Pampers',
            onClick: (product) => showDialog(
                context: ctx,
                builder: (context) {
                  return Container(
                    height: 100,
                    width: 100,
                    child: Center(child: Text("Tapped $product")),
                  );
                }),
          );
        }),
    Story(
        section: 'ProductTile',
        name: 'Tiles in Grid',
        builder: (_, k) {
          return GridView.extent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              children: [
                ProductTile(
                  id: '0',
                  photoURL:
                      'https://i5.walmartimages.com/asr/3656689e-71ac-4517-80be-c0cc700e9f80.130d12bcb99aa3b467669a393ddc5ebd.jpeg?odnWidth=408&odnHeight=408&odnBg=ffffff',
                  price: 8.97,
                  title: 'Pampers',
                ),
                ProductTile(
                  id: '0',
                  photoURL:
                      'https://i5.walmartimages.com/asr/3656689e-71ac-4517-80be-c0cc700e9f80.130d12bcb99aa3b467669a393ddc5ebd.jpeg?odnWidth=408&odnHeight=408&odnBg=ffffff',
                  price: 8.97,
                  title: 'Pampers',
                ),
                ProductTile(
                  id: '0',
                  photoURL:
                      'https://i5.walmartimages.com/asr/3656689e-71ac-4517-80be-c0cc700e9f80.130d12bcb99aa3b467669a393ddc5ebd.jpeg?odnWidth=408&odnHeight=408&odnBg=ffffff',
                  price: 8.97,
                  title: 'Pampers',
                )
              ]);
        }),
  ];
}
