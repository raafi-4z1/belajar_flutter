// ignore_for_file: constant_identifier_names
import 'package:belajar_flutter/user/page_nav/contacts.dart';
import 'package:belajar_flutter/user/page_nav/dashboard.dart';
import 'package:belajar_flutter/user/page_nav/data_1.dart';
import 'package:belajar_flutter/user/page_nav/data_2.dart';
import 'package:belajar_flutter/user/page_nav/events.dart';
import 'package:belajar_flutter/user/page_nav/notes.dart';
import 'package:belajar_flutter/user/page_nav/notifications.dart';
import 'package:belajar_flutter/user/page_nav/settings.dart';
import 'package:belajar_flutter/user/navbar/my_header_drawer.dart';
import 'package:belajar_flutter/user/survey/survey.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final ItemListSections currentPage;
  final Function(ItemListSections) onMenuItemTap;

  const NavBar(
      {Key? key, required this.currentPage, required this.onMenuItemTap})
      : super(key: key);

  @override
  _NavBar createState() => _NavBar(currentPage);
}

class _NavBar extends State<NavBar> {
  late ItemListSections currentPage;
  _NavBar(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: [const MyHeaderDrawer(), MyDrawerList()]),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(
              1, ItemListSections.Dashboard.name, Icons.dashboard_outlined),
          menuItem(
              2, ItemListSections.Contacts.name, Icons.people_alt_outlined),
          menuItem(3, ItemListSections.Events.name, Icons.event_outlined),
          const Divider(),
          menuItem(4, ItemListSections.Notes.name, Icons.notes_outlined),
          menuItem(5, ItemListSections.Settings.name, Icons.settings_outlined),
          const Divider(),
          menuItem(6, ItemListSections.Notifications.name,
              Icons.notifications_outlined),
          expansionTileSections(
              ItemListSections.Insert.name,
              Icons.dataset_outlined,
              {ItemListSections.Data_1, ItemListSections.Data_2}),
        ],
      ),
    );
  }

  Widget expansionTileSections(
      String title, IconData iconData, Set<ItemListSections> setListSections) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ExpansionTile(
          collapsedShape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          title: Text(title),
          leading: Icon(iconData),
          childrenPadding: const EdgeInsets.only(left: 50.0),
          children: [
            for (ItemListSections item in setListSections)
              ListTile(
                selected: currentPage == ItemListSections.values[ItemListSections.values.indexOf(item)],
                selectedTileColor: Colors.grey[300],
                title: Text(
                  item.toString().split('.').last.replaceAll(RegExp(r'_'), ' '),
                ),
                onTap: () => {
                  Navigator.pop(context),
                  widget.onMenuItemTap(ItemListSections.values[ItemListSections.values.indexOf(item)]),
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(int id, String title, IconData iconData) {
    return Material(
      color: currentPage == ItemListSections.values[id - 1]
          ? Colors.grey[300]
          : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          widget.onMenuItemTap(ItemListSections.values[id - 1]);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(child: Icon(iconData, size: 20, color: Colors.black)),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum ItemListSections {
  Dashboard,
  Contacts,
  Events,
  Notes,
  Settings,
  Notifications,
  Insert,
  Data_1,
  Data_2,
  Survey,
}

Widget buildContainerForCurrentPage(ItemListSections currentPage, Function(ItemListSections) feedbackCallback) {
  final Map<ItemListSections, Widget> pageMap = {
    ItemListSections.Dashboard: DashboardPage(feedbackCallback: feedbackCallback),
    ItemListSections.Contacts: ContactsPage(),
    ItemListSections.Events: EventsPage(),
    ItemListSections.Notes: NotesPage(),
    ItemListSections.Settings: SettingsPage(),
    ItemListSections.Notifications: NotificationsPage(),
    ItemListSections.Data_1: Data1Page(),
    ItemListSections.Data_2: Data2Page(),
    ItemListSections.Survey: SurveyPage(feedbackCallback: feedbackCallback),
  };

  return pageMap[currentPage] ?? Container();
}
