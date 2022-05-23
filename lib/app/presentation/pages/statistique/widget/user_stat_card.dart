import 'package:clicar/app/core/utils/theme.dart';
import 'package:flutter/material.dart';

class UserStatCard extends StatelessWidget {
  final String lastName;
  final String firstName;
  final String type;
  final int stat;
  const UserStatCard({
    Key? key,
    required this.lastName,
    required this.firstName,
    required this.type,
    required this.stat
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.person_rounded),
          title: Text("$firstName $lastName"),
          subtitle: Text(type),
          trailing: Text(
            "$stat",
            style: TextStyle(
              fontSize: CustomTheme.headline,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
