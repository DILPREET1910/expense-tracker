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
          DrawerHeader(child: Icon(Icons.settings)),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "DASHBOARD",
              style: GoogleFonts.ubuntu(fontSize: 20, letterSpacing: 5),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text(
              "MESSAGE",
              style: GoogleFonts.ubuntu(fontSize: 20, letterSpacing: 5),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "SETTINGS",
              style: GoogleFonts.ubuntu(fontSize: 20, letterSpacing: 5),
            ),
          ),
          ListTile(
            onTap: logout,
            leading: Icon(Icons.logout),
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
