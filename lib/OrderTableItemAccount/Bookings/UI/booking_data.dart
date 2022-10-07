import 'package:flutter/material.dart';
import 'package:hungerz_store/Themes/colors.dart';

class Bookings extends StatelessWidget {
  final List names = [
    "Samantha Smith",
    "Emili Williamson",
    "Lisa Devis",
    "Samayra Patel",
    "Operum Williamson",
    "George Williamson"
  ];
  final List ocassion = [
    "Birthday Party",
    "Aniversary",
    "For Date",
    "Birthday Party",
    "Aniversary",
    "For Date"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    names[index],
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.phone,
                    color: kMainColor,
                    size: 18,
                  )
                ],
              ),
              Row(
                children: [
                  Text("3 Persons",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.grey,
                            fontSize: 13,
                          )),
                  Spacer(),
                  Text("For 10 Jun, 11:00 am",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.grey[800],
                            fontSize: 13,
                          ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(ocassion[index],
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.grey[700],
                            fontSize: 13,
                          ))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              )
            ],
          ),
        );
      },
    );
  }
}
