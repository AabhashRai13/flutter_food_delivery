import 'package:flutter/material.dart';
import 'package:hungerz_store/OrderTableItemAccount/Order/UI/orderinfo_page.dart';
import 'package:hungerz_store/models/all_data.dart';
import 'package:intl/intl.dart';

class OrderListWidget extends StatelessWidget {
  const OrderListWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final AllData data;
  @override
  Widget build(BuildContext context) {
    var createdDate = data.orders!.createdAt ?? '' as DateTime;
    String formattedDate =
        DateFormat('dd MMM yyy, hh:mm a').format(createdDate);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => OrderInfo(
                                  data: data,
                                ))),
                    // Navigator.pushNamed(context, MaterialPageRoute(builder: (_) => OrderInfo(data: data,))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                data.user!.name ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize: 13.3, letterSpacing: 0.07),
                              ),
                              const Spacer(),
                              Text(data.orders!.status ?? 'unknown',
                                  // AppLocalizations.of(context)!.pending!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                          color: const Color(0xffffa025),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.7,
                                          letterSpacing: 0.06)),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Order AE5587 | $formattedDate',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 11.7,
                                        letterSpacing: 0.06,
                                        fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Text(
                                '\$ ${data.orders!.total != null ? data.orders!.total.toString() : '0'} | COD',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 11.7,
                                        letterSpacing: 0.06,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 1.0,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.orders!.products!.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(data.products![index].listingName ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          fontSize: 11.7,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.06,
                                          color: Colors.black)),
                              Text(
                                " * ${data.orders!.products![index].quantity != null ? data.orders!.products![index].quantity.toString() : '0'}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 11.7,
                                        letterSpacing: 0.06,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ))),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 8.0,
                ),
              ],
            ),
          ),
          RotatedBox(
            quarterTurns: -1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 30,
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Row(
                children: [
                  Text("Delivery",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 11.7,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const Spacer(),
                  Text("1:20",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 11.7,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
