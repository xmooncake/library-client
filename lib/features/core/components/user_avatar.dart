import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:library_client/features/app/app.dart';
import 'package:library_client/features/app/bloc/app_bloc.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    super.key,
    this.showUsername = true,
    this.radius = 50,
  });

  final bool showUsername;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      height: size.height * (showUsername ? 0.25 : 0.18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: radius,
            backgroundImage: const NetworkImage(
              'https://play-lh.googleusercontent.com/SZpyRU_FB9qpQsO8uXRrQcC1RZ-HFvqzmB2aaJ-QdK-PA_Rg-bx90onXgHUcwZpg18k',
            ),
          ),
          const SizedBox(height: 10),
          if (showUsername)
            AutoSizeText(
              maxLines: 1,
              (appBloc.state as AppAuthenticatedState).user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
