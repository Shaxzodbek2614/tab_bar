import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text(
              "Tab bar",
              style: TextStyle(color: Colors.white),
            )),
            backgroundColor: Colors.blue,
            bottom: const TabBar(dividerColor: Colors.transparent,tabs: [
              Tab(
                icon: Icon(Icons.verified_user,
                color: Colors.white,),

              ),
              Tab(
                icon: Icon(Icons.group,
                color: Colors.white,),
              )
            ]),
          ),
          body: TabBarView(children:<Widget>[
            NestedTabBar('Flights'),
            NestedTabBar('Trips'),
            NestedTabBar('Explore'),
          ]),
        ));
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.blueGrey,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'Overview'),
            Tab(text: 'Specifications'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: Overview tab')),
                color: Colors.tealAccent,
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text('${widget.outerTab}: Specifications tab')),
                color: Colors.tealAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

