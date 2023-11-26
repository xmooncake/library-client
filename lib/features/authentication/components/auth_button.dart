import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    super.key,
    this.isLoading = false,
    required this.onPressed,
  });

  final bool isLoading;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: size.width * 0.15,
          child: ElevatedButton(
            onPressed: onPressed,
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text('Login'),
          ),
        ),
      ),
    );
  }
}
