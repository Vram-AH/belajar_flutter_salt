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

    Color mianColor = const Color.fromARGB(255, 94, 172, 228);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        currentIndex: bottomNavBarIndex,
        onTap: (value) {
          setState(() {
            bottomNavBarIndex = value;
          });
        },
        // items berguna untuk tambah icon yang akan di munculkan pada botton bar
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3), label: 'GridView'),
        ],
      ),
      body:
          // kondisi = jika bottomNavbarIndex 0 maka tampil list product jika 1 tampil grid product
          (bottomNavBarIndex == 0) ? const ListProduct() : const GridProduct(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mianColor,
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
            icon: const Icon(Icons.logout),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({Key? key}) : super(key: key);

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
                ProductWidget(product: products[index]),
          );
        }
        return Container();
      },
    );
  }
}
