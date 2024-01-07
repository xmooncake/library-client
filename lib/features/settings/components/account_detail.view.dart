import 'package:flutter/material.dart';

class AccountDetailsWidget extends StatelessWidget {
  const AccountDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return const Flexible(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
