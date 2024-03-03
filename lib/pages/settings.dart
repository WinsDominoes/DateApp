import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/dialogs/about.dart';
import '../widgets/dialogs/community.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemBuilder: (context, index) => const _ListItem(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  await launchUrl(
                      Uri.parse(
                          'https://git.winscloud.net/WinsDominoes/dateapp'),
                      mode: LaunchMode.externalApplication);
                },
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: const ListTile(
                  leading: Icon(Icons.code),
                  title: Text("Source Code"),
                  trailing: Wrap(
                    // space between two icons
                    children: <Widget>[
                      Icon(Icons.open_in_new), // icon-1// icon-2
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1.0,
              ),
              InkWell(
                  onTap: () => communityDialogBuilder(context),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  child: const ListTile(
                    leading: Icon(Icons.people),
                    title: Text("Join Community"),
                  )),
            ],
          ),
        ),
        Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => aboutDialogBuilder(context),
              child: const ListTile(
                leading: Icon(Icons.info_outlined),
                title: Text("About"),
              ),
            ))
      ],
    );
  }
}
