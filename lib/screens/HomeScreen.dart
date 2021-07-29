import 'package:desfoodd/Modles/Catagories_moddle.dart';
import 'package:desfoodd/Provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CatagoriesModle> burgerList = [];

  Widget catagoriesContainer({required String image, required String name}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget bottonContainer({required String name, required String image}) {
    return Container(
      height: 270,
      width: 220,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 60,
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.orange,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.orange),
      ),
    );
  }

  Widget burger() {
    return Row(
      children: burgerList
          .map((e) => catagoriesContainer(image: e.image, name: e.name))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getCategories();
    burgerList = provider.throwList;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("DESFOOD"),
                  accountEmail: Text("deneme@gmail.com"),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("resimler/a.png"),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("resimler/facebook.png"),
                  ),
                ),
                drawerItem(name: "Profil Ekranı", icon: Icons.person),
                drawerItem(name: "Bildirimler", icon: Icons.notifications),
                drawerItem(name: "Ayarlar", icon: Icons.settings),
                Divider(
                  thickness: 2,
                  color: Colors.orange,
                ),
                ListTile(
                  leading: Text(
                    "Topluluk",
                    style: TextStyle(fontSize: 20, color: Colors.orange),
                  ),
                ),
                drawerItem(name: "Gizlilik", icon: Icons.lock),
                drawerItem(name: "Çıkış Yap", icon: Icons.exit_to_app),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("resimler/a.png"),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Yemek Ara",
                hintStyle: TextStyle(
                  color: Colors.orange,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.orange,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                burger(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 510,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: false,
              primary: false,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                bottonContainer(name: "Burger", image: "resimler/google.png"),
                bottonContainer(name: "Burger", image: "resimler/google.png"),
                bottonContainer(name: "Burger", image: "resimler/google.png"),
                bottonContainer(name: "Burger", image: "resimler/google.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
