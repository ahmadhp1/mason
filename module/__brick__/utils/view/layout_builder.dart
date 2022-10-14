import 'package:flutter/widgets.dart';

typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

class ResponsiveLayoutBuilder extends StatelessWidget {
  final ResponsiveLayoutWidgetBuilder phone;
  final ResponsiveLayoutWidgetBuilder? tablet;
  final Widget? child;

  const ResponsiveLayoutBuilder({
    Key? key,
    required this.phone,
    this.tablet,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 480) {
          return phone(context, child);
        } else {
          return (tablet ?? phone).call(context, child);
        }
      },
    );
  }
}
