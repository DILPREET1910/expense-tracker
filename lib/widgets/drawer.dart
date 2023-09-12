import 'package:expense_tracker/pages/dashboard.dart';
import 'package:expense_tracker/services/graph/pieChart.dart';
import 'package:expense_tracker/widgets/appBar.dart';
import 'package:expense_tracker/widgets/dataEntriesCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsDrawer extends StatefulWidget {
  const WidgetsDrawer({Key? key}) : super(key: key);

  @override
  State<WidgetsDrawer> createState() => _WidgetsDrawerState();
}

class _WidgetsDrawerState extends State<WidgetsDrawer> {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[400],
      elevation: 0,
      child: Column(
        children: [
          const DrawerHeader(child: Icon(Icons.settings)),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WidgetsDashBoard(
                        appBar: true,
                      )));
            },
            leading: const Icon(Icons.home),
            title: Text(
              "DASHBOARD",
              style: GoogleFonts.ubuntu(fontSize: 20, letterSpacing: 5),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scaffold(
                        appBar: WidgetsAppBar(height: 50),
                        body: const SizedBox(
                            height: double.infinity,
                            child: WidgetsDataEntriesCard()),
                      )));
            },
            leading: const Icon(Icons.add_chart),
            title: Text(
              "DATA ENTRIES",
              style: GoogleFonts.ubuntu(fontSize: 20, letterSpacing: 5),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "SETTINGS",
              style: GoogleFonts.ubuntu(fontSize: 20, letterSpacing: 5),
            ),
          ),
          ListTile(
            onTap: logout,
            leading: const Icon(Icons.logout),
            title: Text(
              "LOGOUT",
              style: GoogleFonts.ubuntu(fontSize: 20, letterSpacing: 5),
            ),
          ),
        ],
      ),
    );
  }
}
