import 'package:flutter/material.dart';
import 'package:aits_task/widgets/category_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:aits_task/provider/category_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final data = Provider.of<CategoryDataProvider>(context, listen: false);
    data.getGalleryData(context);
  }
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final categoryProvider = Provider.of<CategoryDataProvider>(context);
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
      body: categoryProvider.isLoading
      ? const Center(child: CircularProgressIndicator())
      : Container(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: isPortrait ? 1.0 : 1.2,
            ),
            itemCount: categoryProvider.categoryData.category.length,
            itemBuilder: (context, index) {
              var categoryInfo = categoryProvider.categoryData.category[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryListTile(
                  name: categoryInfo.name!,
                  uuid: categoryInfo.uuid!,
                  slug: categoryInfo.slug!,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
