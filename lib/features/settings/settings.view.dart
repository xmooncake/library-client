import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(100),
      child: Card(
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      'https://lh3.googleusercontent.com/8CUfRL089ZpHqozoSNvHMLQzxZHvQPtvQNiQDpaLFDDwFOKPtBz_mCTVX-teyMfN1ZV7p3Y4yIy3ATZrGzfPJI9Af2H4NEBovtcN4A',
                    ),
                    //TODO: Name from server
                    const Text('Siusiusiu'),
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
    );
  }
}
