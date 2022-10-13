part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildImage() {
    return Row(children: [
      Image.network(
        "https://www.kindpng.com/picc/m/382-3826731_grab-food-logo-png-transparent-png.png",
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildImage(),
                _buildImage(),
                _buildImage(),
                _buildImage(),
              ],
            ),
            _buildImage(),
            _buildImage(),
            _buildImage(),
          ],
        ),
      )),
    );
  }
}
