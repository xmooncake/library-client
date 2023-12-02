import 'package:flutter/material.dart';

import 'package:library_client/data/models/user.dart';
import 'package:library_client/features/app/app.dart';
import 'package:library_client/features/app/bloc/app_bloc.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = (appBloc.state as AppAuthenticatedState).user;

    return Card(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage:
                NetworkImage('https://picsum.photos/seed/picsum/200/300'),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(user.name, style: const TextStyle(fontSize: 20)),
              Text(user.email, style: const TextStyle(fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
