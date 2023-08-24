import 'package:flutter/material.dart';
import '/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? name;
  final Color? backgroundcolor;

  const CustomCardType2(
      {Key? key,
      required this.imageUrl,
      required this.backgroundcolor,
      this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        elevation: 20,
        shadowColor: AppTheme.primary.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: backgroundcolor,
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: FadeInImage(
                        image: AssetImage(imageUrl),
                        placeholder: const AssetImage('assets/jar-loading.gif'),
                        width: double.maxFinite,
                        height: 230,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0),
                  padding: const EdgeInsets.all(1.0),
                  child: Center(
                    child: Text(
                      name ?? 'No Title',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ))
          ]),
        ));
  }
}
