import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  final String name;
  final String surname;
  final String mail;
  final String twitter;

  const ProfileInformation(
      {Key? key,
        required this.name,
        required this.surname,
        required this.mail,
        required this.twitter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: Text("$name $surname"),
        ),
        ListTile(
          leading: const Icon(Icons.mail),
          title: Text(mail),
        ),
        ListTile(
          leading: const Icon(Icons.alternate_email),
          title: Text(twitter),
        ),
      ],
    );
  }
}