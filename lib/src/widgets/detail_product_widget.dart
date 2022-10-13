part of 'widgets.dart';

class DetailProductWidget extends StatelessWidget {
  final DetailProductModel detailProduct;

  const DetailProductWidget({super.key, required this.detailProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: detailProduct.id!,
              child: Image.network(
                detailProduct.image!,
                fit: BoxFit.fill,
                width: 300,
                height: 300,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            detailProduct.title!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text("Rp.${detailProduct.price!}"),
          Text(detailProduct.description!)
        ],
      ),
    );
  }
}
