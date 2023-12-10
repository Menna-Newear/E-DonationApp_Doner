import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_donation_app_doner/constants/appConstants.dart';
import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:e_donation_app_doner/models/product_model.dart';
import 'package:e_donation_app_doner/providers/product_provider.dart';
import 'package:e_donation_app_doner/widgets/itemsWidget.dart';
import 'package:e_donation_app_doner/widgets/noSearchFound.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const routeName = '/Search Screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  List<ProductModel> searchProductList = [];
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String? productCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    final List<ProductModel> productList = productCategory == null
        ? productProvider.getProducts
        : productProvider.findByCategory(ctgName: productCategory);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              productCategory ?? "Search",
              style: FontsStyles.teststyle17,
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppConstant.logo),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchProductList = productProvider.searchQuery(
                      searchText: searchTextController.text,
                      passedList: productList,
                    );
                  });
                },
                onSubmitted: (value) {
                  searchProductList = productProvider.searchQuery(
                    searchText: searchTextController.text,
                    passedList: productList,
                  );
                },
                controller: searchTextController,
                decoration: InputDecoration(
                    hintText: "Search",
                    filled: true,
                    prefixIcon: GestureDetector(
                        onTap: () {}, child: const Icon(Icons.search)),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            searchTextController.clear();
                            FocusScope.of(context).unfocus();
                          });
                        },
                        child: const Icon(Icons.clear))),
              ),
              if (searchTextController.text.isNotEmpty &&
                  searchProductList.isEmpty) ...[
                const Center(
                  child: Column(
                    children: [
                      NoSearchFound(
                        imagePath: "assets/images/persons/sad_person.png",
                        title: "Nothing found,",
                        subTttle: "Please try something else",
                      ),
                    ],
                  ),
                ),
              ],
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: DynamicHeightGridView(
                      builder: (context, index) {
                        return Center(
                          child: ItemWidget(
                            productID: searchTextController.text.isNotEmpty
                                ? searchProductList[index].productId
                                : productList[index].productId,
                          ),
                        );
                      },
                      itemCount: searchTextController.text.isNotEmpty
                          ? searchProductList.length
                          : productList.length,
                      crossAxisCount: 2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
