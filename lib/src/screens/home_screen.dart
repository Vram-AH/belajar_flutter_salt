part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
              text: 'My',
              style: TextStyle(color: Colors.black, fontSize: 25),
              children: <TextSpan>[
                TextSpan(
                    text: 'IFA',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ))
              ]),
        ),
        const Text(
          'Impresive Financial Assistant',
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 11,
              color: Color.fromARGB(255, 96, 97, 97)),
        )
      ],
    );
  }

  Widget _buildDescriptionText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Mencatat Keuangan Lebih Mudah!',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: Colors.black),
        ),
        Text(
          'Untuk financial planning kamu apa pun tujuanmu',
          style: TextStyle(
              height: 2,
              fontStyle: FontStyle.normal,
              fontSize: 13,
              color: Color.fromARGB(255, 96, 97, 97)),
        )
      ],
    );
  }

  Widget _buildImage() {
    return Column(
      children: [
        SizedBox(
            width: 400,
            height: 250,
            child: Image.network(
                'https://www.kindpng.com/picc/m/16-166102_one-piece-ace-vector-hd-png-download.png'))
      ],
    );
  }

  Widget _buildButton() {
    return Column(
      children: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                fixedSize: const Size(350, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {},
            child: const Text(
              'Daftar Sekarang!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        //Buat Text Button disini
        TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 4, 131, 235),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
            child: const Text('Saya sudah memiliki akun'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildHeaderText(),
            const SizedBox(height: 24),
            _buildDescriptionText(),
            const SizedBox(height: 50),
            _buildImage(),
            const SizedBox(height: 40),
            _buildButton(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
