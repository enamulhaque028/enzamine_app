import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  final String imageUrl;

  const CategoryListTile({Key? key, required this.imageUrl}) : super(key: key);

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
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: double.maxFinite,
                width: double.maxFinite,
                ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    'IMG_20220202_22450669',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 9),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(228, 229, 229, 1)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'JPG',
                    style: TextStyle(color: Color.fromRGBO(79, 44, 255, 1)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.folder,
                        color: Color.fromRGBO(79, 44, 255, 1),
                        size: 16,
                      ),
                      SizedBox(width: 7),
                      Text('3 MB'),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.calendar_view_month_rounded,
                        color: Color.fromRGBO(79, 44, 255, 1),
                        size: 16,
                      ),
                      SizedBox(width: 7),
                      Text('12/10/2021'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 13),
        ],
      ),
    );
  }
}
