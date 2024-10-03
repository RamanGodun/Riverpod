import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/enum_activity_state.dart';
import '../../../widgets/error_dialog.dart';
import 'enum_activity_provider.dart';

final errorHandlingProvider = Provider.autoDispose<ErrorHandlingService>((ref) {
  return ErrorHandlingService();
});

class ErrorHandlingService {
  void listenForFailures(WidgetRef ref, BuildContext context) {
    ref.listen<EnumActivityState>(
      enumActivityProvider,
      (previous, next) {
        if (next.status == ActivityStatus.failure && context.mounted) {
          ErrorDialog.show(context, next.error);
        }
      },
    );
  }
}
