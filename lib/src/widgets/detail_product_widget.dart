// ignore_for_file: prefer_const_constructors

part of 'widgets.dart';

class DetailProductWidget extends StatelessWidget {
  final DetailProductModel detailProduct;

  const DetailProductWidget({super.key, required this.detailProduct});

  // Widget _buildColor() {
  //   return Container(
  //     margin: EdgeInsets.only(
  //       top: 5,
  //       right: 5,
  //     ),
  //     padding: EdgeInsets.all(2.5),
  //     height: 24,
  //     width: 24,
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       border: Border.all(
  //         color: Color(0xFF356C95),
  //       ),
  //     ),
  //     child: DecoratedBox(
  //       decoration: BoxDecoration(
  //         color: Colors.red,
  //         shape: BoxShape.circle,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.47),
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.amber[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        detailProduct.title!,
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Price\n",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                              TextSpan(
                                  text: "Rp.${detailProduct.price!}",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ))
                        ],
                      ),
                      Center(
                        child: Hero(
                          tag: detailProduct.id!,
                          child: Image.network(
                            detailProduct.image!,
                            fit: BoxFit.contain,
                            width: 250,
                            height: 225,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Text('Color'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 5,
                                      right: 5,
                                    ),
                                    padding: EdgeInsets.all(2.5),
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFF356C95),
                                      ),
                                    ),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF356C95),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 5,
                                      right: 5,
                                    ),
                                    padding: EdgeInsets.all(2.5),
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFF356C95),
                                      ),
                                    ),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 5,
                                      right: 5,
                                    ),
                                    padding: EdgeInsets.all(2.5),
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFF356C95),
                                      ),
                                    ),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(detailProduct.description!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.normal))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
