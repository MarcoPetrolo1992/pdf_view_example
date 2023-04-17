import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class BaseWidget extends StatefulWidget {
  final Widget child;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaLeft;
  final bool safeAreaRight;

  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final Color? backgroundColor;
  final Color? drawerScrimColor;
  final bool primary;
  final ValueNotifier<bool>? progress;
  final ValueNotifier<bool>? absorbPointerLayerProgress;
  final EdgeInsets safeAreaMinimum;

  //----------------------------------------------------------------------------

  const BaseWidget({
    Key? key,
    this.progress,
    this.absorbPointerLayerProgress,
    this.safeAreaTop = true,
    this.safeAreaBottom = false,
    this.safeAreaLeft = false,
    this.safeAreaRight = false,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.safeAreaMinimum = EdgeInsets.zero,
    required this.child,
  }) : super(key: key);

  //----------------------------------------------------------------------------

  @override
  BaseWidgetState createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
        persistentFooterButtons: widget.persistentFooterButtons,
        drawer: widget.drawer,
        endDrawer: widget.endDrawer,
        bottomNavigationBar: widget.bottomNavigationBar,
        bottomSheet: widget.bottomSheet,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        primary: widget.primary,
        drawerDragStartBehavior: widget.drawerDragStartBehavior,
        extendBody: widget.extendBody,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        drawerScrimColor: widget.drawerScrimColor,
        drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
        body: SafeArea(
            top: widget.safeAreaTop,
            bottom: widget.safeAreaBottom,
            left: widget.safeAreaLeft,
            right: widget.safeAreaRight,
            minimum: widget.safeAreaMinimum,
            child: Stack(children: <Widget>[
              widget.child,
              _buildLoader(),
              _buildAbsorbPointerLayer(),
            ])));
  }

  @override
  void dispose() {
    super.dispose();
  }

  //----------------------------------------------------------------------------

  ///
  Widget _buildLoader() {
    if (widget.progress != null) {
      return ValueListenableBuilder(
          valueListenable: widget.progress!,
          builder: (BuildContext context, bool value, Widget? child) {
            if (value) {
              return Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  width: double.infinity,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ));
            }
            return const IgnorePointer();
          });
    }
    return const IgnorePointer();
  }

  ///
  Widget _buildAbsorbPointerLayer() {
    if (widget.absorbPointerLayerProgress != null) {
      return ValueListenableBuilder(
          valueListenable: widget.absorbPointerLayerProgress!,
          builder: (BuildContext context, bool value, Widget? child) {
            if (value) {
              return Container(
                color: Colors.transparent,
                height: double.infinity,
                width: double.infinity,
              );
            }
            return const IgnorePointer();
          });
    }
    return const IgnorePointer();
  }
}
