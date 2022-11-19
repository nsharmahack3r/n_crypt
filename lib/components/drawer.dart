import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/auth_controller.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Drawer(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: ()=>Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back)
              ),
            ],
          ),
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Image.asset('assets/images/user.jpeg'),
            ),
            accountName: Text('${user!.id}'),
            accountEmail: Text('${user.email}'),
          )
        ],
      ),
    );
  }
}