import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

int selectedIndex = 0;
final List<String> categories = [
  'boom',
  'bam',
  'hentai',
  'panda',
  'anime',
  'manga',
];

class _CategorySelectorState extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0,
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color:
                        index == selectedIndex ? Colors.white : Colors.white60,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                )),
          );
        },
      ),
    );
  }
}
