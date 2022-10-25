import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/user/user_cubit.dart';

class Review {
  final String? title;
  final double rating;
  final String date;
  final String? content;

  Review(this.title, this.rating, this.date, this.content);
}

class ReviewPage extends StatefulWidget {
  final String? shopName;
  const ReviewPage({super.key, this.shopName});

  @override
  ReviewPageState createState() => ReviewPageState();
}

class ReviewPageState extends State<ReviewPage> {
  final UserCubit userCubit = instance<UserCubit>();
  @override
  void initState() {
    super.initState();
    log("length ${userCubit.ratings.length} ");
    log("User ${userCubit.ratings[0].user!.name!}");
  }

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    final List<Review> listOfReviews = [
      Review(
          appLocalization.name1, 4.0, '5 April, 20', appLocalization.content1),
      Review(
          appLocalization.name2, 5.0, '23 Feb, 20', appLocalization.content2),
      Review(
          appLocalization.name3, 4.0, '16 May, 20', appLocalization.content1),
      Review(
          appLocalization.name1, 5.0, '13 Feb, 20', appLocalization.content2),
      Review(
          appLocalization.name3, 4.0, '11 June, 20', appLocalization.content2),
      Review(
          appLocalization.name2, 5.0, '13 Feb, 20', appLocalization.content2),
      Review(
          appLocalization.name1, 4.0, '26 April, 20', appLocalization.content1),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          flexibleSpace: Container(
            padding: const EdgeInsets.only(left: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Text(
                  userCubit.shopName ?? "",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xff7ac81e),
                      size: 14,
                    ),
                    const SizedBox(width: 8.0),
                    Text('4.2',
                        style: Theme.of(context)
                            .textTheme
                            .overline!
                            .copyWith(color: const Color(0xff7ac81e))),
                    const SizedBox(width: 8.0),
                    Text('${userCubit.ratings.length} reviews',
                        style: Theme.of(context).textTheme.overline),
                  ],
                ),
              ],
            ),
          ),
          titleSpacing: 0,
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
        ),
      ),
      body: ListView.builder(
          itemCount: userCubit.ratings.length,
          itemBuilder: (context, index) {
            if (userCubit.ratings.isEmpty) return const SizedBox();
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 6.7,
                  ),
                  Text(
                    userCubit.ratings[index].user!.name!,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 15.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xff7ac81e),
                          size: 13,
                        ),
                        const SizedBox(width: 8.0),
                        Text(userCubit.ratings[index].ratings!.star.toString(),
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: const Color(0xff7ac81e),
                                    )),
                        const Spacer(),
                        Text(
                          listOfReviews[index].date,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 11.7, color: const Color(0xffd7d7d7)),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    userCubit.ratings[index].ratings!.description!,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: const Color(0xff6a6c74)),
                  )
                ],
              ),
            );
          }),
    );
  }
}
