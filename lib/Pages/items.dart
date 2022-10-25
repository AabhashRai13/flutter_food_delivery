import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Pages/additem.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/bloc/products/products_cubit.dart';
import 'package:hungerz_store/models/product_id.dart';
import '../app/di.dart';

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
  final ProductCubit _productCubit = instance<ProductCubit>();
  List<int> availability = [];
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  getProducts() async {
    await _productCubit.getAllProducts();
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
      body: BlocBuilder<ProductCubit, ProductState>(
        bloc: _productCubit,
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return ListView(
              children: <Widget>[
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 6.3,
                ),
                ...state.products.map((productId) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => AddItem(
                                    isEditing: true,
                                    productId: productId,
                                    productCubit: _productCubit,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 16.0),
                      child: Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.22,
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: (productId.product.imageUrl == null ||
                                        productId.product.imageUrl!
                                            .trim()
                                            .isEmpty)
                                    ? Image.asset(
                                        'images/2.png',
                                        scale: 1.6,
                                      )
                                    : Image.network(
                                        productId.product.imageUrl!,
                                      ),
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
                                        Text(
                                            '\$ ${productId.product.rentalPrice}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption),
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
                                  '',
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
            );
          } else if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AddItem(
                        isEditing: false,
                        productCubit: _productCubit,
                      )));
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
