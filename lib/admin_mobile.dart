import 'package:flutter/material.dart';

class AdminMobile extends StatefulWidget {
  const AdminMobile({super.key, required this.title});

  final String title;

  @override
  State<AdminMobile> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AdminMobile> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.black))),
            child: NavigationRail(
                leading: Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Icon(Icons.format_quote_sharp)),
                destinations: [
                  NavigationRailDestination(
                      icon: Icon(Icons.people),
                      label: Text(""),
                      padding: EdgeInsets.symmetric(vertical: 12.0)),
                  NavigationRailDestination(
                      icon: Icon(Icons.face),
                      label: Text(""),
                      padding: EdgeInsets.symmetric(vertical: 12.0)),
                  NavigationRailDestination(
                      icon: Icon(Icons.bookmark),
                      label: Text(""),
                      padding: EdgeInsets.symmetric(vertical: 12.0)),
                ],
                selectedIndex: _selectedindex)),
        Expanded(
            child: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: PostsHeader()),
              Expanded(child: MockCardList())
            ],
          ),
        ))
      ],
    )));
  }
}

class PostsHeader extends StatefulWidget {
  const PostsHeader({super.key});

  @override
  State<PostsHeader> createState() => _PostsHeaderState();
}

class _PostsHeaderState extends State<PostsHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [PostStatus(), AllTypes()],
    ));
  }
}

class PostStatus extends StatelessWidget {
  const PostStatus({super.key});
  @override
  Widget build(BuildContext context) {
    final int _posts = 20;
    return Container(
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                child: Icon(Icons.list),
                backgroundColor: Colors.grey,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Posts"), Text("$_posts Posts")],
          )
        ],
      ),
    );
  }
}

class AllTypes extends StatelessWidget {
  const AllTypes({super.key});
  @override
  Widget build(BuildContext context) {
    final int _posts = 20;
    return Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                child: Icon(Icons.list),
                backgroundColor: Colors.grey,
              )),
          Text("All Types"),
        ],
      ),
    );
  }
}

class MockCardList extends StatelessWidget {
  const MockCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        MockCard(),
        MockCard(),
        MockCard(),
        MockCard(),
        MockCard(),
      ],
    );
  }
}

class MockCard extends StatelessWidget {
  const MockCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Pean"),
            subtitle: Text("2 min ago")),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 56),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 4),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Text(
              "Weak reason. No action required.",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Report Details",
                ),
                Text("Archive"),
                Text("Publish"),
              ],
            )),
      ],
    ));
  }
}
