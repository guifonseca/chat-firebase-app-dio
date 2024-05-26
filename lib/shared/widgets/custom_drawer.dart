import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebaseappdio/pages/tarefa/tarefa_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text("Tarefas"),
            onTap: () async {
              await analytics.logEvent(name: "Tarefas").then((_) =>
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const TarefaPage())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text("Crashlytics"),
            onTap: () async {
              await analytics.logEvent(name: "Exception");
              throw Exception();
            },
          ),
        ],
      ),
    );
  }
}
