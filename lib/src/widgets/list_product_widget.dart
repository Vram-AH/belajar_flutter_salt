part of 'widgets.dart';

class ListProductWidget extends StatelessWidget {
  final ProductModel product;

  const ListProductWidget({super.key, required this.product});

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
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // image network
              children: [
                Hero(
                  tag: product.id!,
                  child: Image.network(
                    product.image!,
                    fit: BoxFit.contain,
                    width: size.width,
                    height: 300,
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
    );
  }
}
