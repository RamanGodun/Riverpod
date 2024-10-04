import 'package:flutter/material.dart';

import 'text_widget.dart';

abstract class AppMiniWidgets {
/*
   */
  static Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
  /*
    *
   */

  static Widget errorWidget(BuildContext context, Object e, {StackTrace? st}) {
    //! it's necessary to handle StackTrace st value
    return Center(
      child: TextWidget(
        e.toString(),
        TextType.error,
      ),
    );
  }
  /*
   */
}
