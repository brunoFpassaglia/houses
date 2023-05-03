import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:houses/feature/house_rules/domain/entities/house_rules.dart';
import 'package:houses/presentation/house_rules/house_rules_show_page.dart';

class HouseRulesCard extends StatelessWidget {
  const HouseRulesCard({super.key, required this.houseRules});
  final HouseRules houseRules;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.push(MaterialPageRoute(
            builder: ((context) =>
                HouseRulesShowPage(houseRules: houseRules))));
      },
      child: Card(
        margin: const EdgeInsets.all(2.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.house_rounded,
                size: 80,
                color: houseRules.active == 1 ? Colors.black : Colors.grey[200],
              ),
              Text(
                houseRules.name,
                style: TextStyle(
                  fontSize: 12,
                  color:
                      houseRules.active == 1 ? Colors.black : Colors.grey[400],
                ),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
