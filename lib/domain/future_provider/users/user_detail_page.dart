import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';
import 'package:riverpod_project/widgets/text_widgets.dart';

// import '../providers/users_providers_gen.dart'; //in case of code generation
import '../providers/users_providers.dart'; //in case of we don't use code generation

class UserDetailPage extends ConsumerWidget {
  final int userId;
  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetail = ref.watch(userDetailProvider(userId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: TextWidgets.titleSmallText(context, 'User Detail'),
      ),
      body: userDetail.when(
        data: (user) {
          return Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  left: 25, right: 20, bottom: 200, top: 50),
              children: [
                Text(
                  user.name,
                  style: theme.textTheme.headlineMedium,
                ),
                const Divider(),
                UserInfo(
                  iconData: Icons.account_circle,
                  userInfo: user.username,
                ),
                const SizedBox(height: 10),
                UserInfo(
                  iconData: Icons.email_rounded,
                  userInfo: user.email,
                ),
                const SizedBox(height: 10),
                UserInfo(
                  iconData: Icons.phone_enabled,
                  userInfo: user.phone,
                ),
                const SizedBox(height: 10),
                UserInfo(
                  iconData: Icons.web_rounded,
                  userInfo: user.website,
                ),
              ],
            ),
          );
        },
        error: (e, st) => AppMiniWidgets.errorWidget(context, e),
        loading: () => AppMiniWidgets.loadingWidget(),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final IconData iconData;
  final String userInfo;
  const UserInfo({
    super.key,
    required this.iconData,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 10),
        Text(
          userInfo,
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
