import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/grocery_item_tile.dart';
import '../../provider/Platform_Switch.dart';
import '../../provider/navigator_provader.dart';

class HomepageAndriod extends StatefulWidget {
  const HomepageAndriod({super.key});

  @override
  State<HomepageAndriod> createState() => _HomepageAndriodState();
}

class _HomepageAndriodState extends State<HomepageAndriod> {
  @override
  Widget build(BuildContext context) {
    // List of screens corresponding to each tab
    final List<Widget> screens = [
      ListView.builder(
        itemCount: chatItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: FlutterLogo(),
            // CircleAvatar(

            // backgroundImage: AssetImage(chatItems[index].imagePath),
            // ),
            title: Text(chatItems[index].name),
            subtitle: Text(chatItems[index].message),
            trailing: Text(chatItems[index].time),
          );
        },
      ),
      Center(
        child: Text('Calls Screen'),
      ),
      Center(
        child: Text('Settings Screen'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Drawer(
          surfaceTintColor: Colors.red,
        ),
        title: Text(
          'Platform Convertor',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        actions: [
          Switch(
            value: Provider.of<PlateformProvider>(context).isIos,
            onChanged: (val) {
              Provider.of<PlateformProvider>(context, listen: false)
                  .togglePlateform();
            },
          ),
        ],
      ),
      body: Consumer<BottomNavigationProvider>(
        builder: (context, provider, child) {
          return screens[provider.selectedIndex];
        },
      ),
      bottomNavigationBar: Consumer<BottomNavigationProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.selectedIndex,
            onTap: provider.setSelectedIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
