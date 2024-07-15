import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/dataofchats.dart';
import '../../provider/Platform_Switch.dart';
import '../../provider/navigator_provader.dart'; // Import the provider

class HomepageIos extends StatefulWidget {
  const HomepageIos({super.key});

  @override
  State<HomepageIos> createState() => _HomepageIosState();
}

class _HomepageIosState extends State<HomepageIos> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      ListView.builder(
        itemCount: chatItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: CupertinoListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(chatItems[index].imagePath),
                ),
                title: Text(chatItems[index].name),
                subtitle: Text(chatItems[index].message),
                trailing: Text(chatItems[index].time),
              ),
            ),
          );
        },
      ),
      Center(child: Text('Calls Screen')),
      Center(child: Text('Settings Screen')),
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey6,
        middle: const Text(
          'Platform Converter',
          style: TextStyle(
            fontSize: 16,
            color: CupertinoColors.systemGrey,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoSwitch(
              value: Provider.of<PlateformProvider>(context).isIos,
              onChanged: (val) {
                Provider.of<PlateformProvider>(context, listen: false)
                    .togglePlateform();
              },
            ),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Consumer<BottomNavigationProvider>(
              builder: (context, provider, child) {
                return screens[provider.selectedIndex];
              },
            ),
          ),
          Consumer<BottomNavigationProvider>(
            builder: (context, provider, child) {
              return CupertinoTabBar(
                currentIndex: provider.selectedIndex,
                onTap: provider.setSelectedIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.chat_bubble_2),
                    label: 'Chats',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.phone),
                    label: 'Calls',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings),
                    label: 'Settings',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;

  CupertinoListTile({
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                SizedBox(height: 10),
                subtitle,
              ],
            ),
          ),
        ),
        trailing,
      ],
    );
  }
}
