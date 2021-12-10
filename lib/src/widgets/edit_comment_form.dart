import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/utils/database.dart';
import 'package:myfirstapp/src/utils/validator.dart';

import 'custom_form_field.dart';

class EditCommentForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;
  final String currentTitle;
  final String comment;
  final String documentId;

  const EditCommentForm({
    required this.titleFocusNode,
    required this.descriptionFocusNode,
    required this.currentTitle,
    required this.comment,
    required this.documentId,
  });

  @override
  _EditCommentFormState createState() => _EditCommentFormState();
}

class _EditCommentFormState extends State<EditCommentForm> {
  final _EditCommentFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController(
      text: widget.currentTitle,
    );

    _descriptionController = TextEditingController(
      text: widget.comment,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _EditCommentFormKey,
      child: ListView(
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
                TextFormField(
                  controller: _titleController,
                  focusNode: widget.titleFocusNode,
                  keyboardType: TextInputType.text,
                  enabled: false,
                  readOnly: true,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Comment',
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
                  label: 'Comment',
                  hint: 'Enter your note description',
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
              : Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        CustomColors.firebaseOrange,
                      ),
                      minimumSize: MaterialStateProperty.all(Size.zero),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      widget.titleFocusNode.unfocus();
                      widget.descriptionFocusNode.unfocus();

                      if (_EditCommentFormKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.updateComments(
                          docId: widget.documentId,
                          comment: _descriptionController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'Update Comment',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.firebaseGrey,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
