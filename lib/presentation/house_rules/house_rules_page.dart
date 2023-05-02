import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:houses/presentation/house_rules/house_rules_bloc.dart';
import 'package:houses/presentation/house_rules/house_rules_card.dart';
import 'package:houses/presentation/house_rules/house_rules_event.dart';
import 'package:houses/presentation/house_rules/house_rules_state.dart';

import 'house_rules_form.dart';

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
              icon:
                  Icon(!isGrid ? Icons.grid_view_rounded : Icons.list_rounded),
              onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RefreshIndicator(
          onRefresh: () async {
            _houseRulesBloc.add(LoadHouseRulesEvent());
          },
          child: BlocProvider.value(
            value: _houseRulesBloc,
            child: BlocConsumer<HouseRulesBloc, HouseRulesState>(
                listener: (context, state) {
              if (state is HouseRulesSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                  ),
                );
                _houseRulesBloc.add(LoadHouseRulesEvent());
              }
              if (state is HouseRulesCreateError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
                _houseRulesBloc.add(LoadHouseRulesEvent());
              }
              if (state is HouseRulesUpdateError ||
                  state is HouseRulesDeleteError) {
                _houseRulesBloc.add(LoadHouseRulesEvent());
              }
            }, builder: (context, state) {
              if (state is HouseRulesGetSuccess) {
                return !isGrid
                    ? ListView.builder(
                        itemCount: state.houseRules.length,
                        itemBuilder: (context, index) =>
                            AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 200),
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: HouseRulesCard(
                                  houseRules: state.houseRules[index]),
                            ),
                          ),
                        ),
                      )
                    : GridView.builder(
                        itemCount: state.houseRules.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                childAspectRatio: 1, maxCrossAxisExtent: 150),
                        itemBuilder: (context, index) =>
                            AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 200),
                          columnCount: 3,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: HouseRulesCard(
                                  houseRules: state.houseRules[index]),
                            ),
                          ),
                        ),
                      );
              }
              if (state is HouseRulesGetError) {
                return ListView(
                  children: [
                    Center(child: Text(state.error)),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showNewPopUP();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future _showNewPopUP() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          var _formKey = GlobalKey<FormState>();
          var _controller = TextEditingController();
          var active = 0;
          return AlertDialog(
            title: const Text('New House Rules'),
            content: StatefulBuilder(builder: (context, setState) {
              return HouseRulesForm(
                formKey: _formKey,
                controller: _controller,
                switchValue: active,
                switchCallback: (value) {
                  setState(() {
                    if (value) {
                      active = 1;
                    } else {
                      active = 0;
                    }
                  });
                },
              );
            }),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _houseRulesBloc.add(CreateHouseRulesEvent(
                        _controller.text,
                        active,
                      ));
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }
}
