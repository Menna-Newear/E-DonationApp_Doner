import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:e_donation_app_doner/providers/product_provider.dart';
import 'package:e_donation_app_doner/screens/addDonation_screen.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key, required this.productID});
  final String productID;
  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    final getCurrentProduct = productProvider.findByProdId(widget.productID);
    Size size = MediaQuery.of(context).size;

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : InkWell(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => AddDonationScreen(
                            productModel: getCurrentProduct,
                          ))));
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FancyShimmerImage(
                    boxFit: BoxFit.fill,
                    imageUrl: getCurrentProduct.productImage,
                    width: double.infinity,
                    height: size.height * 0.22,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              getCurrentProduct.productTitle,
                              overflow: TextOverflow.ellipsis,
                              style: FontsStyles.teststyle15,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
