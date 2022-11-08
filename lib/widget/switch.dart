import 'package:flutter/material.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/data/local/prefs.dart';
import 'package:hungerz_store/models/products.dart';
import 'package:hungerz_store/repositories/product_repository.dart';

class AvailabilitySwitch extends StatefulWidget {
  final bool? inStock;
  final String? productId;
  final Products product;
  const AvailabilitySwitch(
      {super.key, this.inStock, this.productId, required this.product});

  @override
  State<AvailabilitySwitch> createState() => _AvailabilitySwitchState();
}

class _AvailabilitySwitchState extends State<AvailabilitySwitch> {
  bool? available = false;
  String? stock = "Not Available";
  late String? userId = "";
  final AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  void initState() {
    super.initState();
    available = widget.inStock ?? false;
    if (available == true) {
      stock = "Available";
    } else if (widget.inStock == false) {
      stock = "Not Available";
    }
    getUserId();
  }

  getUserId() async {
    userId = await _appPreferences.getUserID();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          stock!,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Switch(
          activeColor: kMainColor,
          activeTrackColor: Colors.grey[200],
          value: available!,
          onChanged: (value) async {
            setState(() {
              available = value;
              if (available == true) {
                stock = "Available";
              } else if (available == false) {
                stock = "Not Available";
              }
            });
            await ProductRepository().editProducts(
              productId: widget.productId!,
              inStock: available,
              userId: userId!,
              description: widget.product.description ?? "",
              listingCategory: widget.product.listingCategory ?? "",
              listingName: widget.product.listingName ?? "",
              rentalDuration: widget.product.rentalDuration ?? "",
              rentalFor: widget.product.rentalFor ?? "",
              rentalPrice: widget.product.rentalPrice ?? 0,
              pickup: widget.product.pickup ?? 0,
              typeOfRental: widget.product.typeOfRental ?? 0,
              rentingRules: widget.product.rentingRules ?? "",
              imageUrl: widget.product.imageUrl ?? "",
            );
            // AppLocalizations.of(context)!.outStock;
          },
        ),
      ],
    );
  }
}
