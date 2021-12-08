import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/utils/database.dart';
import 'package:myfirstapp/src/utils/validator.dart';

import 'custom_form_field.dart';

// ignore: must_be_immutable
class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;

  const AddItemForm({
    Key? key,
    required this.titleFocusNode,
    required this.descriptionFocusNode,
    required User user,
  })  : _user = user,
        super(key: key);

  final User _user;

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  late User _user;

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                Text(
                  'Title',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _titleController,
                  focusNode: widget.titleFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Title',
                  hint: 'Enter your title',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Description',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 10,
                  isLabelEnabled: false,
                  controller: _descriptionController,
                  focusNode: widget.descriptionFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Description',
                  hint: 'Enter your feeling',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  ),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      CustomColors.firebaseOrange,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    widget.titleFocusNode.unfocus();
                    widget.descriptionFocusNode.unfocus();

                    if (_addItemFormKey.currentState!.validate()) {
                      setState(() {
                        _isProcessing = true;
                      });

                      await Database.addItem(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          user: _user.displayName.toString());

                      setState(() {
                        _isProcessing = false;
                      });

                      Navigator.of(context).pop();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text(
                      'ADD ITEM',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.firebaseGrey,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
