part of 'screens.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // Inisiasi Storage / Shared Preference
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  String nama = "";
//  variable untuk tahu posisi botton nav bar yang nyala atau sedang di tekan
  int bottomNavBarIndex = 0;

  void ubahNama() {
    setState(() {
      nama = "Vram AH";
    });
  }

  @override
  void initState() {
    // getResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //posisi index = 0

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 220, 152, 57),
        title: Text(nama),
        actions: [
          IconButton(onPressed: ubahNama, icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () async {
                SharedPreferences storage = await prefs;
                if (storage.getBool('pernah_login') == true) {
                  storage.clear().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  });
                }
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 220, 152, 57),
        currentIndex: bottomNavBarIndex,
        onTap: (value) {
          setState(() {
            bottomNavBarIndex = value;
          });
        },
        items: const [
          //Index ke 0
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView'),
          //Index ke 1
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3), label: 'GridView'),
        ],
      ),
      body:
          // Perbandingan                 //Nilai True          //Nilai False
          (bottomNavBarIndex == 0) ? const ListProduct() : const GridProduct(),
    );
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: http.get(Uri.parse("https://fakestoreapi.com/products")),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          final products = productModelFromJson(snapshot.data!.body);
          return GridView.count(
            crossAxisCount: 2,
            children: products
                .map((e) => GridProductWidget(
                      product: e,
                    ))
                .toList(),
          );
        }
        return Container();
      },
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: http.get(Uri.parse("https://fakestoreapi.com/products")),
      builder: (context, snapshot) {
        //Widget ketika loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        //Widget ketika datanya di load
        if (snapshot.hasData) {
          final products = productModelFromJson(snapshot.data!.body);
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) =>
                ListProductWidget(product: products[index]),
          );
        }
        return Container();
      },
    );
  }
}
