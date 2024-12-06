import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  LeftDrawer({required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home,
                      color: selectedIndex == 0
                          ? Color(0xFF0C1B33)
                          : Colors.grey),
                  title: Text(
                    "Home",
                    style: TextStyle(
                      color: selectedIndex == 0
                          ? Color(0xFF0C1B33)
                          : Colors.grey,
                      fontWeight: selectedIndex == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () => onItemSelected(0),
                ),
                ListTile(
                  leading: Icon(Icons.store,
                      color: selectedIndex == 1
                          ? Color(0xFF0C1B33)
                          : Colors.grey),
                  title: Text(
                    "Shops",
                    style: TextStyle(
                      color: selectedIndex == 1
                          ? Color(0xFF0C1B33)
                          : Colors.grey,
                      fontWeight: selectedIndex == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () => onItemSelected(1),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xFF0C1B33)),
          ListTile(
            leading: Icon(Icons.logout, color: Color(0xFF0C1B33)),
            title: Text("Logout", style: TextStyle(color: Color(0xFF0C1B33))),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
