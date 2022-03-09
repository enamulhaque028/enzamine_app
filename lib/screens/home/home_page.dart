import 'package:flutter/material.dart';
import 'package:aits_task/widgets/category_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
          leading: const Icon(Icons.menu),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: isPortrait ? 1.0 : 1.2,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    var imageUrl = 'https://enamulhaque028.github.io/profile/img/profile.jpg';
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryListTile(
                        imageUrl: imageUrl,
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
