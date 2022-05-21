import 'package:flutter/material.dart';
import '/Provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts'), actions: [
        IconButton(
            onPressed: () => Provider.of<HomeProvider>(context, listen: false)
                .logOut(context),
            icon: const Icon(Icons.logout))
      ]),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: provider.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      horizontalTitleGap: 10,
                      style: ListTileStyle.list,
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(provider.posts[index].title),
                      subtitle: Text(provider.posts[index].body,
                          textAlign: TextAlign.justify),
                    ));
                  },
                );
        },
      ),
    );
  }
}
