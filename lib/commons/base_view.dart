import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  BaseView({required this.isLoading, required this.child});

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return !this.isLoading
        ? child
        : Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black54.withOpacity(0.3),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
