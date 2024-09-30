import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/custom_list_tile.dart';
import 'package:riverpod_project/widgets/text_widgets.dart';

import '../../../../data/helpers.dart';
import '../../../../widgets/mini_widgets.dart';
import '../../providers/users_providers.dart';
import 'user_detail_page.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: userList.when(
        data: (users) {
          return ListView.separated(
            itemCount: users.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];

              return GestureDetector(
                onTap: () =>
                    Helpers.pushTo(context, UserDetailPage(userId: user.id)),
                child: AppListTile(
                  leading: CircleAvatar(
                      child: TextWidgets.titleSmallText(
                          context, user.id.toString())),
                  title: user.name,
                ),
              );
            },
          );
        },
        error: (error, stackTrace) =>
            AppMiniWidgets.errorWidget(context, error),
        loading: () => AppMiniWidgets.loadingWidget(),
      ),
      /*
        * ALTERNATIVE syntax
        * The following is an example of using `switch` with `AsyncValue`.
        * This demonstrates how to handle the different states of `userList` in an alternative way.
      */
      // body: switch (userList) {
      //   // Correctly accessing the data inside AsyncData using 'value'
      //   AsyncData(:final value) => ListView.separated(
      //       itemCount: value.length,
      //       separatorBuilder: (BuildContext context, int index) {
      //         return const Divider();
      //       },
      //       itemBuilder: (BuildContext context, int index) {
      //         final user = value[index];

      //         return GestureDetector(
      //           onTap: () =>
      //               Helpers.pushTo(context, UserDetailPage(userId: user.id)),
      //           child: AppListTile(
      //             leading: CircleAvatar(
      //                 child: TextWidgets.headlineText(
      //                     context, user.id.toString())),
      //             title: user.name,
      //           ),
      //         );
      //       },
      //     ),
      //   AsyncError(:final error) => AppMiniWidgets.errorWidget(context, error),
      //   _ => AppMiniWidgets.loadingWidget(),
      // },
    );
  }
}
