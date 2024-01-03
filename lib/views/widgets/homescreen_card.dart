import 'package:flutter/material.dart';

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white),
        height: 130,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 50,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color.fromARGB(255, 220, 227, 243)),
                child: const Center(
                  child: Text(
                    '01',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 48, 5, 105)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'David Morguili',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 4, 19, 88),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'example@gmail.com',
                    style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                  ),
                  Text(
                    'Created:05/03/2023',
                    style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                  ),
                  Text(
                    'Mob:9745434523',
                    style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 40,
              width: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 220, 227, 243)),
              child: const Center(
                child: Text(
                  'Flutter',
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 19, 88),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.phone_in_talk,
              size: 35,
              color: Color.fromARGB(255, 4, 19, 88),
            )
          ],
        ),
      ),
    );
  }
}
