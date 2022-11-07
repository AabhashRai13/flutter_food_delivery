import 'package:flutter/material.dart';
import 'package:hungerz_store/Pages/additem.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/bloc/products/products_cubit.dart';
import 'package:hungerz_store/models/product_id.dart';
import 'package:hungerz_store/widget/switch.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget(
      {super.key, required this.itemList, required this.productCubit});
  final List<ProductId> itemList;
  final ProductCubit productCubit;
  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 6.3,
        ),
        ...widget.itemList.map((productId) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddItem(
                            isEditing: true,
                            productId: productId,
                            productCubit: widget.productCubit,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.22,
                        width: MediaQuery.of(context).size.width * 0.22,
                        child: (productId.product.imageUrl == null ||
                                productId.product.imageUrl!.trim().isEmpty)
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
                            child: Text('\$ ${productId.product.rentalPrice}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                                productId.product.typeOfRental == 0
                                    ? 'Hourly'
                                    : productId.product.typeOfRental == 1
                                        ? 'Daily'
                                        : productId.product.typeOfRental == 2
                                            ? "Weekly"
                                            : productId.product.typeOfRental ==
                                                    3
                                                ? 'Monthly'
                                                : 'Unknown',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                          )
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
                        AvailabilitySwitch(
                          inStock: productId.product.inStock,
                          productId: productId.id,
                          product: productId.product,
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
  }
}
