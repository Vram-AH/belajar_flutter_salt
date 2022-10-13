// ignore_for_file: avoid_print

part of 'widgets.dart';

class LifecycleWidget extends StatefulWidget {
  final Widget child;

  const LifecycleWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<LifecycleWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget>
    with WidgetsBindingObserver {
  // Tambahkan initState
  @override
  void initState() {
    // implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  // tambahkan didChangeAppLifecycleState
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // implement didChangeAppLifecycleState
    print('AppLifecycleState: $state');
    if (state == AppLifecycleState.resumed) {
      print("App Resumed, Selamat Datang Kembali");
    } else if (state == AppLifecycleState.detached) {
      print("App Ditutup, Selamat Tinggal");
    } else if (state == AppLifecycleState.paused) {
      print("App Di Pause");
    } else if (state == AppLifecycleState.inactive) {
      print("App Inactive");
    }
    super.didChangeAppLifecycleState(state);
  }

  // tambahkan dispose
  @override
  void dispose() {
    // implement dispose
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
