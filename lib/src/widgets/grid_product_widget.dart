part of 'widgets.dart';

class GridProductWidget extends StatelessWidget {
  final ProductModel product;

  const GridProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailProductScreen(productId: product.id!)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // image network
              children: [
                Hero(
                  tag: product.id!,
                  child: Image.network(
                    product.image!,
                    fit: BoxFit.fill,
                    width: size.width,
                    height: 130,
                  ),
                ),

                // Text nama product
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Text(product.title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    // Text harga product
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'RP ', decimalDigits: 0)
                          .format(product.price!),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
