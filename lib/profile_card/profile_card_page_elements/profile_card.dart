import 'package:flutter/material.dart';
import 'package:tp1_interfaces_graphiques/profile_card/profile_card_page_elements/profile_card_elements/profile_information.dart';
import 'package:tp1_interfaces_graphiques/profile_card/profile_card_page_elements/profile_card_elements/profile_picture.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String surname;
  final String mail;
  final String twitter;
  final String imageUrl;

  const ProfileCard(
      {Key? key,
      required this.name,
      required this.surname,
      required this.mail,
      required this.twitter,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfilePicture(imageUrl: imageUrl),
            ProfileInformation(
                name: name, surname: surname, mail: mail, twitter: twitter),
          ],
        ),
      )),
    );
  }
}
