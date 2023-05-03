import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:houses/feature/house_rules/domain/entities/house_rules.dart';
import 'package:houses/presentation/house_rules/house_rules_bloc.dart';
import 'package:houses/presentation/house_rules/house_rules_event.dart';
import 'package:houses/presentation/house_rules/house_rules_form.dart';
import 'package:houses/presentation/house_rules/house_rules_state.dart';

class HouseRulesShowPage extends StatefulWidget {
  final HouseRules houseRules;
  const HouseRulesShowPage({super.key, required this.houseRules});

  @override
  State<HouseRulesShowPage> createState() => _HouseRulesShowPageState();
}

class _HouseRulesShowPageState extends State<HouseRulesShowPage> {
  final _formKey = GlobalKey<FormState>();
  late int active;
  late TextEditingController _controller;
  late HouseRulesBloc _bloc;

  @override
  void initState() {
    super.initState();
    active = widget.houseRules.active;
    _controller = TextEditingController.fromValue(
        TextEditingValue(text: widget.houseRules.name));
    _bloc = Modular.get<HouseRulesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 1,
        title: Text(widget.houseRules.name),
        centerTitle: true,
      ),
      body: BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          if (state is HouseRulesLoading) {
            _showLoadingPopUp();
          }
          if (state is HouseRulesSuccess) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
          if (state is HouseRulesError) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.house_rounded,
                size: MediaQuery.of(context).size.height / 3,
                color: widget.houseRules.active == 1
                    ? Colors.black
                    : Colors.grey[200],
              ),
              Text(
                widget.houseRules.active == 1 ? 'Active' : 'Inactive',
                style: TextStyle(
                  fontSize: 12,
                  color: widget.houseRules.active == 1
                      ? Colors.black
                      : Colors.grey[400],
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 80,
                    onPressed: () async {
                      await _showEditPopUP();
                    },
                    icon: Icon(
                      Icons.edit_note_rounded,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    iconSize: 80,
                    onPressed: () async {
                      await _showConfirmDeletePopUp();
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _showLoadingPopUp() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Loading...')
                ],
              ),
            ),
          );
        });
  }

  Future _showConfirmDeletePopUp() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete'),
            content: const Text('Are you sure you want to delete this entry?'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text("Delete"),
                  onPressed: () {
                    _bloc.add(DeleteHouseRulesEvent(widget.houseRules));
                    Navigator.of(context).pop();
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

  Future _showEditPopUP() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit'),
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
                      _bloc.add(UpdateHouseRulesEvent(
                        widget.houseRules,
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
