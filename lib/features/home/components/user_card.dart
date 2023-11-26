import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:
                NetworkImage('https://picsum.photos/seed/picsum/200/300'),
          ),
          SizedBox(width: 10),
          Text('John Doe', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
