import 'package:app/controllers/provider/home_provider.dart';
import 'package:app/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, _) {
          if (homeProvider.leads.isEmpty) {
            homeProvider.fetchLeadsFromDatabase();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: homeProvider.leads.length,
            itemBuilder: (context, index) {
              final lead = homeProvider.leads[index];
              final rawDate = lead.createdAt;
              final parsedDate = DateTime.parse(rawDate);
              final formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
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
                            Text(
                              lead.name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 4, 19, 88),
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              lead.email,
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              'Created:$formattedDate',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              'Mob:${lead.mobile}',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                              ),
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
            },
          );
        },
      ),
    );
  }
}
