import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_demo/Pages/Personalization/Database/user_info.dart';

class Personalization extends StatefulWidget {
  const Personalization({super.key});

  @override
  State<Personalization> createState() => _PersonalizationState();
}

class _PersonalizationState extends State<Personalization> {
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfo>(context, listen: false);

    return FutureBuilder(
      future: userInfo.initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.grey[500],
            appBar: AppBar(
              backgroundColor: Colors.grey[800],
              centerTitle: true,
              title: Text(
                'Personalization',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Consumer<UserInfo>(
              builder: (context, userInfo, child) {
                return FutureBuilder<List<String>>(
                  future: userInfo.getAllergens(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final allergens = snapshot.data ?? [];
                      return Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Allergens',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              itemCount: userInfo.allergylist.length,
                              itemBuilder: (context, index) {
                                final allergen = userInfo.allergylist[index];
                                final isChecked = allergens.contains(allergen);
                                return Card(
                                  child: CheckboxListTile(
                                    title: Text(allergen),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      if (value == true) {
                                        userInfo.addAllergen(allergen);
                                      } else {
                                        userInfo.removeAllergen(allergen);
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}