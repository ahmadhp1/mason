import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:{{packageName}}/utils/di/injection.dart';
import 'package:{{packageName}}/utils/view/layout_builder.dart';
import '{{{pathToModule}}}/presentation/{{screens_fn}}/{{phone_view_fn}}.dart';
import '{{{pathToModule}}}/presentation/{{screens_fn}}/{{tablet_view_fn}}.dart';
import '{{{pathToModule}}}/application/{{bloc_fn}}/{{bloc_fn}}.dart';

class {{Screen}} extends StatelessWidget {
  const {{Screen}}({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<{{Bloc}}>(),
      child: ResponsiveLayoutBuilder(
          phone: (context, child) {
            return const {{PhoneView}}();
          },
          tablet: (context, child) {
            return const {{TabletView}}();
          },
        ),
    );
  }
}
