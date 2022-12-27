import 'package:flutter/material.dart';

class ProfileCardPage extends StatelessWidget {
  final String title;

  const ProfileCardPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: ProfileCard(
                surname: "Engel",
                name: "Arthur",
                mail: "arthur.engel@domain.fr",
                twitter: "@ArthE",
                imageUrl: "https://source.unsplash.com/random/300×300/?person")),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String surname;
  final String name;
  final String mail;
  final String twitter;
  final String imageUrl;

  const ProfileCard(
      {Key? key,
      required this.surname,
      required this.name,
      required this.mail,
      required this.twitter,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfilePicture(imageUrl: imageUrl),
            ProfileInformation(surname: surname, name: name, mail: mail, twitter: twitter),
          ],
        ),
    ));
  }
}

class ProfilePicture extends StatelessWidget {
  final String imageUrl;

  const ProfilePicture({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}

class ProfileInformation extends StatelessWidget {
  final String surname;
  final String name;
  final String mail;
  final String twitter;

  const ProfileInformation(
      {Key? key,
      required this.surname,
      required this.name,
      required this.mail,
      required this.twitter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: Text("$surname $name"),
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
