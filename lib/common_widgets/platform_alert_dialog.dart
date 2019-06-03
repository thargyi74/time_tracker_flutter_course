import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_tracker_flutter_course/common_widgets/platform_widget.dart';

class PlatformAlertDialog extends PlatFormWidget {
  PlatformAlertDialog(
      {@required this.title,
      @required this.content,
      @required this.defaultActionText});

  final String title;
  final String content;
  final String defaultActionText;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    // TODO: implement buildCupertinoWidget
    return null;
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    // TODO: implement buildMaterialWidget
    return null;
  }
}
