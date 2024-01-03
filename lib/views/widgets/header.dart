import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 8,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      'assets/images/menu.png',
                    )),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Lead List',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 2, 47, 83)),
                ),
                const SizedBox(
                  width: 160,
                ),
                SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset(
                      'assets/images/bell1.png',
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
