import 'package:flutter/material.dart';

import 'package:library_client/features/core/components/user_avatar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width * 0.7,
        height: size.height * 0.7,
        child: Card(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const UserAvatarWidget(),
                      ListTile(
                        title: const Text('Account Information'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Address Information'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Change Password'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Siaiaiaiaia'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
