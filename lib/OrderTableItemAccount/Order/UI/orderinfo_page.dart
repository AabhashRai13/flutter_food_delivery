import 'package:flutter/material.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/custom_appbar.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/models/all_data.dart';
import 'package:intl/intl.dart';

class OrderInfo extends StatefulWidget {
  final AllData data;

  const OrderInfo({super.key, required this.data});
  @override
  OrderInfoState createState() => OrderInfoState();
}

class OrderInfoState extends State<OrderInfo> {
  @override
  Widget build(BuildContext context) {
    var createdDate = widget.data.orders!.createdAt ?? '' as DateTime;
    String formattedDate =
        DateFormat('dd MMM yyy, hh:mm a').format(createdDate);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110.0),
        child: CustomAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 30,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListTile(
                title: Text(
                  widget.data.user!.name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 14, letterSpacing: 0.07),
                ),
                subtitle: Text(
                  'AE5587 |  $formattedDate',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 11.7, letterSpacing: 0.06),
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.message,
                          color: kMainColor,
                          size: 20.0,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, PageRoutes.chatPage);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.phone,
                          color: kMainColor,
                          size: 20.0,
                        ),
                        onPressed: () {
                          /*.......*/
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(AppLocalizations.of(context)!.item!,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: const Color(0xffadadad),
                          fontWeight: FontWeight.bold)),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.data.orders!.products!.length,
                itemBuilder: ((context, index) => Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              widget.data.products![index].listingName ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                            ),
                            const Spacer(),
                            Text(
                              widget.data.orders!.products![index].quantity !=
                                      null
                                  ? widget
                                      .data.orders!.products![index].quantity
                                      .toString()
                                  : '0',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
                            ),
                            const SizedBox(
                              width: 50.0,
                            ),
                            Text(
                              '\$ ${widget.data.products![index].rentalPrice ?? '0'}',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 13.3),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 1.0,
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Text(
                    AppLocalizations.of(context)!.payment!.toUpperCase(),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: kDisabledColor, fontWeight: FontWeight.bold)),
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.sub!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        '\$ 19.50',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ]),
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 1.0,
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.service!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        '\$ 1.50',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ]),
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 1.0,
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.cod!,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$ ${widget.data.orders!.total != null ? widget.data.orders!.total.toString() : '0'}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Container(
                height: 180.0,
                color: Theme.of(context).cardColor,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.pushNamed(context, PageRoutes.track),
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 22.0,
                        backgroundImage: AssetImage('images/profile.jpg'),
                      ),
                      title: Text(
                        'George Anderson',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 15.0, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        AppLocalizations.of(context)!.deliveryPartner!,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 11.7, letterSpacing: 0.06),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.navigation,
                          color: kMainColor,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                BottomBar(
                    text: AppLocalizations.of(context)!.ready,
                    onTap: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
