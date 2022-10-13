part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _buildLogo() {
    return Image.asset(
      "assets/images/MHB GOBAH LOGO.png",
      height: 150,
      width: 180,
    );
  }

  Widget _buildHeaderText(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          Text(
            'Mansur Hot Burger Gobah',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Selamat datang kembali",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration myDecorationStyle() => BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      );

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  Widget _buildTextLogPas(String hint, TextEditingController newController,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: myDecorationStyle(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            controller: newController,
            keyboardType: isPassword
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            obscureText: isPassword ? true : false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
        Text('Recovery Pasword',
            style: TextStyle(fontSize: 15, color: Colors.black54))
      ]),
    );
  }

  bool isLoginProcessing = false;
  String username = "";

  Widget _buildButton(BuildContext context) {
    return ButtonWidget(
      onPressed: () async {
        //Untuk init si storage
        final SharedPreferences storage = await prefs;

        setState(() {
          isLoginProcessing = true;
        });

        Future.delayed(const Duration(milliseconds: 3000), () {
          //Jika emailnya adalah nama@gmail.com dan passwordnya 12345678
          //Maka diarahkan ke ListScreen
          if (emailController.text == "vram3012@gmail.com" &&
              passController.text == '123456') {
            //Simpan Session
            storage.setBool('pernah_login', true);

            //Arahkan ke ListScreen
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListScreen(),
                ));

            setState(() {
              isLoginProcessing = false;
            });
          } else {
            setState(() {
              isLoginProcessing = false;
            });
            storage.setBool('pernah_login', false);

            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Login Gagal')));
          }
          //Jika tidak, maka muncul snackbar
        });
      },
      isLoading: isLoginProcessing,
      caption: 'Login',
    );
  }

  Widget _buildTextContinue() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Or continue with",
            style: TextStyle(fontSize: 15, color: Colors.black54),
          )
        ],
      ),
    );
  }

  Widget _buildSocmedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Image.asset(
            "assets/images/google.png",
            height: 60,
            width: 35,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Image.asset(
            "assets/images/apple.png",
            height: 60,
            width: 35,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Image.asset(
            "assets/images/facebook.png",
            height: 60,
            width: 35,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not a member?",
          style: TextStyle(
              fontSize: 15, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Register now",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.blue),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildLogo(),
              //Text hello dan welcome back
              _buildHeaderText(size),
              const SizedBox(height: 20),
              //Textfield untuk username dan password
              _buildTextLogPas("username", emailController),
              const SizedBox(height: 20),
              _buildTextLogPas("pasword", passController),
              const SizedBox(height: 20),
              //Text recovery password
              _buildText(),
              const SizedBox(height: 20),
              //Button Sign In
              _buildButton(context),
              const SizedBox(height: 20),
              //Text continue with
              _buildTextContinue(),
              const SizedBox(height: 20),
              //Social Media Button
              _buildSocmedButton(),
              const SizedBox(height: 20),
              //butotn register
              _buildButtonRegister(),
            ],
          ),
        ),
      ),
    );
  }
}
