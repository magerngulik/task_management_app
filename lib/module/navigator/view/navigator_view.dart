import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigatorView extends ConsumerStatefulWidget {
  const NavigatorView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavigatorViewState();
}

class _NavigatorViewState extends ConsumerState<NavigatorView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    NavigatorController controller = ref.watch(navigatorController);
    controller.view = widget;

    return DefaultTabController(
      length: 4,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            const DashboardView(),
            const TaskProjectListView(),
            Container(
              color: Colors.purple[100],
            ),
            const ProfileView()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.red[700],
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Task Project",
              icon: Icon(
                Icons.list_alt,
              ),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(
                Icons.favorite,
              ),
            ),
            BottomNavigationBarItem(
              label: "Me",
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
