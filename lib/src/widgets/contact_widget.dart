part of 'widgets.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel data;

  const ContactWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.all(8),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(40),
                child: Image.asset(
                  data.imageAssets,
                  fit: BoxFit.cover,
                  width: 46,
                  height: 46,
                ),
              ),
            )),
        const SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              data.message,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
