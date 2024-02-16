import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  final Widget? child;
  final PreferredSizeWidget? appBar;
  final bool avoidBottomInset;
  final Widget? floatingButton;
  final Widget? bottomNavigation;
  final Color? backgroundColor;
  final Key? scaffoldKey;
  final bool extendBodyBehindAppBar;

  const Parent({
    super.key,
    this.child,
    this.appBar,
    this.avoidBottomInset = true,
    this.floatingButton,
    this.backgroundColor,
    this.bottomNavigation,
    this.scaffoldKey,
    this.extendBodyBehindAppBar = false,
  });

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: widget.scaffoldKey,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomInset: widget.avoidBottomInset,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        appBar: widget.appBar,
        body: widget.child,
        floatingActionButton: widget.floatingButton,
        bottomNavigationBar: widget.bottomNavigation,
      ),
    );
  }
}
