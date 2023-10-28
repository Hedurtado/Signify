import 'package:flutter/material.dart';
import 'package:section/screens/screens.dart';

class Template extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String language;

  const Template({
    required this.title,
    required this.imageAsset,
    required this.language,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'home_test');
          },
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              // buildBackButton(context),
              buildImage(context),
              buildText(context),
              buildAprenderButton(context),
              buildTestButton(context),
            ],
          );
        },
      ),
    );
  }

  // Widget buildBackButton(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.only(
  //       right: MediaQuery.of(context).size.width * 0.9,
  //       left: MediaQuery.of(context).size.width * 0.5,
  //       top: MediaQuery.of(context).size.height * 0.05,
  //     ),
  //     child: IconButton(
  //       icon: Icon(
  //         Icons.arrow_back_ios,
  //         color: Colors.black,
  //         size: MediaQuery.of(context).size.width * 0.05,
  //       ),
  //       onPressed: () {
  //         Navigator.pushNamed(context, 'cardview');
  //       },
  //     ),
  //   );
  // }

  Widget buildImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.06,
        left: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Image.asset(
        imageAsset,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.45,
      ),
    );
  }

  Widget buildText(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 35,
          fontFamily: 'istokWeb',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildAprenderButton(BuildContext context) {
    String name;
    if (language == "ecuadorian" || language == "none") {
      name = title;
      name = '${name.toLowerCase()}_lsec';
    } else {
      if (title == 'Abecedario') {
        name = 'Videos';
      } else {
        name = title;
      }
    }
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.1,
      ),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 145, 145, 145),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      VideoPlayerTemplate(name: name)));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Empieza a Aprender',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'istokWeb',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildTestButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.1,
      ),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 145, 145, 145),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'welcometest');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Prueba tus conocimientos!",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'istokWeb',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
