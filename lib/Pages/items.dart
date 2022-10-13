import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Pages/additem.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/models/product_id.dart';
import 'package:hungerz_store/repositories/product_repository.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  ItemsPageState createState() => ItemsPageState();
}

class ItemsPageState extends State<ItemsPage> {
  String? stock = "Not Available";

  bool inStock = false;

  List<DropdownMenuItem<int>> listDrop = [];
  int? selected;
  List<ProductId> productsList = [];
  final ProductRepository _productRepository = ProductRepository();

  late String? userId;
  @override
  void initState() {
    super.initState();
    getUserId();
  }

  getUserId() async {
    // ignore: await_only_futures
    userId = await FirebaseAuth.instance.currentUser!.uid;
    productsList = await _productRepository.getAllProducts(userId: userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Listings",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Divider(
            color: Theme.of(context).cardColor,
            thickness: 6.3,
          ),
          ...productsList.map((productId) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddItem(
                              isEditing: true,
                              productId: productId,
                            )));
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'images/2.png',
                          scale: 1.6,
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(productId.product.listingName ?? '',
                                // AppLocalizations.of(context)!.sandwich!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'images/ic_veg.png',
                                    height: 16.0,
                                    width: 16.7,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('\$ ${productId.product.rentalPrice}',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned.directional(
                      end: 0.0,
                      bottom: 8.0,
                      textDirection: Directionality.of(context),
                      child: Row(
                        children: [
                          Text(
                            '$stock',
                            style: TextStyle(
                                color: kHintColor,
                                fontSize: 13.3,
                                fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            activeColor: kMainColor,
                            activeTrackColor: Colors.grey[200],
                            value: inStock,
                            onChanged: (value) {
                              setState(() {
                                inStock = value;
                              });
                              if (inStock == true) {
                                stock = "Available";
                              } else if (inStock == false) {
                                stock = "Not Available";
                              }
                              // AppLocalizations.of(context)!.outStock;
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const AddItem(isEditing: false)));
        },
        tooltip: AppLocalizations.of(context)!.add,
        child: const Icon(
          Icons.add,
          size: 27,
          color: Colors.white,
        ),
      ),
    );
  }
}
