import 'package:flutter/material.dart';
import 'package:houses/domain/entities/house_rules.dart';

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

  @override
  void initState() {
    super.initState();
    active = widget.houseRules.active;
    _controller = TextEditingController.fromValue(
        TextEditingValue(text: widget.houseRules.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 1,
        title: Text(widget.houseRules.name),
        centerTitle: true,
      ),
      body: Padding(
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
                  onPressed: () {},
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
    );
  }

  Future _showEditPopUP() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit'),
            content: StatefulBuilder(builder: (context, setState) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Active:'),
                          Switch(
                            value: active == 1 ? true : false,
                            onChanged: (value) {
                              setState(() {
                                if (value) {
                                  active = 1;
                                } else {
                                  active = 0;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
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
