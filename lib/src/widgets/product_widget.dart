part of 'widgets.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailProductScreen(productId: product.id!)));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: const Color.fromARGB(255, 150, 192, 214),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // image network
                children: [
                  Hero(
                    tag: product.id!,
                    child: Image.network(
                      product.image!,
                      fit: BoxFit.fitWidth,
                      width: size.width,
                      height: 136,
                    ),
                  ),

                  // Text nama product
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      children: [
                        Text(product.title!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        // Text harga product
                        Text(
                          NumberFormat.currency(
                                  locale: 'id', symbol: 'RP ', decimalDigits: 0)
                              .format(product.price!),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
