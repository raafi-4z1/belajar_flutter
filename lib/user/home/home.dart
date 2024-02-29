import 'package:belajar_flutter/auth/login.dart';
import 'package:belajar_flutter/user/navbar/navbar.dart';
import 'package:flutter/material.dart';

// This is the type used by the popup menu below.
enum PopupItem { profile, logOut }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPage = ItemListSections.Dashboard;
  // PopupItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    var container = buildContainerForCurrentPage(currentPage);

    return Scaffold(
      drawer: NavBar(
          currentPage: currentPage,
          onMenuItemTap: (selectedSection) {
            // Update the currentPage in Home widget
            setState(() {
              currentPage = selectedSection;
            });
          }),
      appBar: AppBar(
          elevation: 0,
          title: Text(currentPage.name.replaceAll(RegExp(r'_'), ' ')),
          centerTitle: true,
          backgroundColor: Colors.green[700],
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PopupMenuButton<PopupItem>(
                // initialValue: selectedItem,
                onSelected: (PopupItem item) {
                  if (item == PopupItem.logOut) {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: const Text('AlertDialog description'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => {
                                    Navigator.pop(context, 'OK'),
                                    Navigator.pop(context),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LogIn())),
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  }
                  // setState(() {
                  //   selectedItem = item;
                  // });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<PopupItem>>[
                  const PopupMenuItem<PopupItem>(
                    value: PopupItem.profile,
                    child: ListTile(
                      leading: Icon(Icons.people_alt_outlined),
                      title: Text('Profile'),
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem<PopupItem>(
                    value: PopupItem.logOut,
                    child: ListTile(
                      leading: Icon(Icons.logout_outlined),
                      title: Text('LogOut'),
                    ),
                  ),
                ],
              ),
            )
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          )),
      body: container,
    );
  }
}
