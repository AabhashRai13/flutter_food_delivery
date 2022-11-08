import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Pages/additem.dart';
import 'package:hungerz_store/Pages/item_widget.dart';
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
  List<ProductId> itemList = [];
  List<ProductId> spaceList = [];
  List<ProductId> lodgingList = [];
  List<ProductId> experienceList = [];
  List<ProductId> packagesList = [];

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
    final List<Tab> tabs = <Tab>[
      const Tab(text: "ITEM"),
      const Tab(text: "Space"),
      const Tab(text: "Lodging"),
      const Tab(text: "Experience"),
      const Tab(text: "Packages"),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "My Listings",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: TabBar(
                tabs: tabs,
                isScrollable: true,
                labelColor: kMainColor,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                indicatorColor: kMainColor,
                unselectedLabelColor: kLightTextColor,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 24.0),
              ),
            ),
          ),
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          bloc: _productCubit,
          builder: (context, state) {
            if (state is ProductsLoaded) {
              itemList.clear();
              spaceList.clear();
              lodgingList.clear();
              experienceList.clear();
              packagesList.clear();
              for (var i = 0; i < state.products.length; i++) {
                if (state.products[i].product.listingCategory!
                        .trim()
                        .toLowerCase() ==
                    'item') {
                  itemList.add(state.products[i]);
                } else if (state.products[i].product.listingCategory!
                        .trim()
                        .toLowerCase() ==
                    'space') {
                  spaceList.add(state.products[i]);
                } else if (state.products[i].product.listingCategory!
                        .trim()
                        .toLowerCase() ==
                    'lodging') {
                  lodgingList.add(state.products[i]);
                } else if (state.products[i].product.listingCategory!
                        .trim()
                        .toLowerCase() ==
                    'experience') {
                  experienceList.add(state.products[i]);
                } else if (state.products[i].product.listingCategory!
                        .trim()
                        .toLowerCase() ==
                    'packages') {
                  packagesList.add(state.products[i]);
                } else {}
              }
              return TabBarView(children: [
                ItemWidget(
                  itemList: itemList,
                  productCubit: _productCubit,
                ),
                ItemWidget(
                  itemList: spaceList,
                  productCubit: _productCubit,
                ),
                ItemWidget(
                  itemList: lodgingList,
                  productCubit: _productCubit,
                ),
                ItemWidget(
                  itemList: experienceList,
                  productCubit: _productCubit,
                ),
                ItemWidget(
                  itemList: packagesList,
                  productCubit: _productCubit,
                )
              ]);
            } else if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
