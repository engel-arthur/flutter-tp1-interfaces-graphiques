import 'package:flutter/material.dart';
import 'package:tp1_interfaces_graphiques/profile_card/profile_card_page_elements/profile_card.dart';

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TP1 - Profile Card'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: ProfileCard(
                name: "John",
                surname: "Doe",
                mail: "john.doe@domain.fr",
                twitter: "@JD",
                imageUrl:
                    "https://source.unsplash.com/random/300×300/?person")),
      ),
    );
  }
}
