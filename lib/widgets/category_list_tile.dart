import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  final String name;
  final String uuid;
  final String slug;

  const CategoryListTile({
    Key? key,
    required this.name,
    required this.uuid,
    required this.slug,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xFF1ACBFC), Color(0xFF1B90F5)],
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
                child: Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    slug,
                    style: const TextStyle(
                      color: Color.fromRGBO(79, 44, 255, 1),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 9),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 7,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(228, 229, 229, 1),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    uuid,
                    style: const TextStyle(
                      color: Color.fromRGBO(79, 44, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
