import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:houses/presentation/house_rules/house_rules_bloc.dart';
import 'package:houses/presentation/house_rules/house_rules_event.dart';
import 'package:houses/presentation/house_rules/house_rules_state.dart';

class HouseRulesPage extends StatefulWidget {
  const HouseRulesPage({super.key});

  @override
  State<HouseRulesPage> createState() => _HouseRulesPageState();
}

class _HouseRulesPageState extends State<HouseRulesPage> {
  final HouseRulesBloc _houseRulesBloc = Modular.get<HouseRulesBloc>();
  late bool isGrid;

  @override
  void initState() {
    _houseRulesBloc.add(LoadHouseRulesEvent());
    isGrid = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 1,
        title: const Text("House Rules"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(isGrid ? Icons.grid_view_rounded : Icons.list_rounded),
              onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              }),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _houseRulesBloc.add(LoadHouseRulesEvent());
        },
        child: BlocBuilder<HouseRulesBloc, HouseRulesState>(
            bloc: _houseRulesBloc,
            builder: (context, state) {
              if (state is HouseRulesSucess) {
                return !isGrid
                    ? ListView.builder(
                        itemCount: state.houseRules.length,
                        itemBuilder: (context, index) => Container(
                              child: Text(state.houseRules[index].name),
                            ))
                    : GridView.builder(
                        itemCount: state.houseRules.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 150),
                        itemBuilder: (context, index) => Container(
                              child: Text(state.houseRules[index].name),
                            ));
              }
              if (state is HouseRulesError) {
                return const Text('Deu ruim');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
