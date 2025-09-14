import 'package:flutter/material.dart';
import 'SpecialContainer.dart';
import 'SecondScreen.dart';
import 'FourthScreen.dart';

ValueNotifier<List<SpecialContainer>> myContainersNotifier =
    ValueNotifier<List<SpecialContainer>>([]);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD8D6F2),

      appBar: AppBar(
        toolbarHeight: 95,
        title: const Text(
          "TODO APP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: "Jost",
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff380565),
      ),

      body: ValueListenableBuilder<List<SpecialContainer>>(
        valueListenable: myContainersNotifier,
        builder: (_, containers, _) {
          return ListView(children: containers);
        },
      ),

      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: const Color(0xff380565),
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () async {
            final result = await Navigator.of(
              context,
            ).pushNamed(SecondScreen.routeName);
            if (result != null && result is Map) {
              myContainersNotifier.value = [
                ...myContainersNotifier.value,
                SpecialContainer(
                  title: result["title"].isNotEmpty
                      ? result["title"]
                      : "TODO TITLE",
                  subtitle: result["detail"].isNotEmpty
                      ? result["detail"]
                      : "TODO SUB TITLE",
                ),
              ];
            }
          },
          child: const Icon(Icons.add, size: 25),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff9395D3), // لون الزر المحدد
        unselectedItemColor: Color(0xff8B8787),
        onTap: (index) {
          setState(() {
            if (index == 1) {
              completeContainers = [];
              completeContainers = myContainersNotifier.value
                  .where((c) => c.isComplete)
                  .map(
                    (c) => SpecialContainer(
                      title: c.title,
                      subtitle: c.subtitle,
                      isEdit: false,
                    ),
                  )
                  .toList();
              Navigator.of(context).pushNamed(FourthScreen.routeName);
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "All"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
        ],
      ),
    );
  }
}
