import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';
import 'package:riverpod_project/widgets/text_widgets.dart';

import '../providers/users_providers_gen.dart'; // in case of code generation
// import '../providers/users_providers.dart'; // in case of we don't use code generation

class UserDetailPage extends ConsumerWidget {
  final int userId;
  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetail = ref.watch(userDetailProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: TextWidgets.titleSmallText(context, 'User Detail'),
      ),
      body: userDetail.when(
        data: (user) {
          final userInfoList = [
            {'icon': Icons.account_circle, 'info': user.username},
            {'icon': Icons.email_rounded, 'info': user.email},
            {'icon': Icons.phone_enabled, 'info': user.phone},
            {'icon': Icons.web_rounded, 'info': user.website},
          ];

          return Center(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  left: 25, right: 20, bottom: 200, top: 50),
              itemCount: userInfoList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      TextWidgets.headlineText(context, user.name),
                      const Divider(),
                    ],
                  );
                } else {
                  final userInfo = userInfoList[index - 1];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: UserInfo(
                      iconData: userInfo['icon'] as IconData,
                      userInfo: userInfo['info'] as String,
                    ),
                  );
                }
              },
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
  const UserInfo({super.key, required this.iconData, required this.userInfo});

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
