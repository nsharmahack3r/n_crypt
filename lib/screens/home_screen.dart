import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:n_crypt/controller/auth_controller.dart';

import '../components/drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor:Colors.black,
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: const Text("Ncrypt"),
          centerTitle: false,
          leading: Builder(builder: (context){
            return IconButton(
              icon: const Icon(Icons.account_circle, size: 40,),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Chats",),
              Tab(text: "Events",),
            ],
          ),
        ),
      ),
    );
  }
}
