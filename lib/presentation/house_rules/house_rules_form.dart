import 'package:flutter/material.dart';

class HouseRulesForm extends StatefulWidget {
  HouseRulesForm({
    super.key,
    required this.formKey,
    required this.controller,
    required this.switchValue,
    required this.switchCallback,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final int switchValue;
  final void Function(bool) switchCallback;

  @override
  State<HouseRulesForm> createState() => _HouseRulesFormState();
}

class _HouseRulesFormState extends State<HouseRulesForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: widget.controller,
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
                  value: widget.switchValue == 1 ? true : false,
                  onChanged: widget.switchCallback,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
