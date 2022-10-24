import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Components/custom_appbar.dart';
import 'package:hungerz_store/Components/entry_field.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/Themes/style.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatWidget();
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
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
              preferredSize: Size.fromHeight(0.0),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                // padding: EdgeInsets.only(top: 12.0),
                child: ListTile(
                  title: Text(
                    'Samantha Smith',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 14, letterSpacing: 0.07),
                  ),
                  subtitle: Text(
                    'AE5587 | June 20, 11:35 am',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 11.7, letterSpacing: 0.06),
                  ),
                  trailing: FittedBox(
                    fit: BoxFit.fill,
                    child: Row(
                      children: <Widget>[
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.message,
                        //     color: kMainColor,
                        //     size: 20.0,
                        //   ),
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, PageRoutes.chatPage);
                        //   },
                        // ),
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
          )),
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/chat_bg.png'), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                Size.fromHeight(130).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MessageStream(),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: EdgeInsets.only(left: 12.0, right: 12, top: 10),
                  child: EntryField(
                    controller: _messageController,
                    hint: AppLocalizations.of(context)!.enterMessage,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: kMainColor,
                      ),
                      onPressed: () {
                        _messageController.clear();
                      },
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MessageBubble> messageBubbles = [
      MessageBubble(
        sender: 'user',
        text: AppLocalizations.of(context)!.heyThere,
        time: '11:58 am',
        isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        sender: 'delivery_partner',
        text: AppLocalizations.of(context)!.onMyWay,
        time: '11:59 am',
        isDelivered: false,
        isMe: false,
      ),
    ];
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: messageBubbles,
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool? isMe;
  final String? text;
  final String? sender;
  final String? time;
  final bool? isDelivered;

  MessageBubble(
      {this.sender, this.text, this.time, this.isMe, this.isDelivered});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 4.0,
            color:
                isMe! ? kMainColor : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(6.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment:
                    isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text!,
                    textAlign: isMe! ? TextAlign.right : TextAlign.left,
                    style: isMe!
                        ? bottomBarTextStyle
                        : Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 15.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        time!,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: isMe!
                              ? kWhiteColor.withOpacity(0.75)
                              : kLightTextColor,
                        ),
                      ),
                      // isMe
                      //     ? Icon(
                      //         Icons.check_circle,
                      //         color: isDelivered ? Colors.blue : kDisabledColor,
                      //         size: 12.0,
                      //       )
                      //     : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
