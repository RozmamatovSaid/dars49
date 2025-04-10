import 'package:flutter/material.dart';
import 'package:dars49/view_models/viewmodel.dart';

class EditDialog extends StatefulWidget {
  Function refresh;
  Viewmodel vm = Viewmodel();

  EditDialog({super.key, required this.vm, required this.refresh});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    widget.vm.imageUrlController.text = widget.vm.model.image;
    widget.vm.nameController.text = widget.vm.model.name;
    widget.vm.lastNameController.text = widget.vm.model.lastName;
    widget.vm.phoneController.text = widget.vm.model.phoneNumber;
    widget.vm.bioController.text = widget.vm.model.bio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.brown.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text("Tahrirlash"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: widget.vm.imageUrlController,
                decoration: InputDecoration(labelText: "Image URL"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Image URL bo'sh bo'lmasin";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: widget.vm.nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name bo'sh bo'lmasin";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: widget.vm.lastNameController,
                decoration: InputDecoration(labelText: "Last Name"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Last name bo'sh bo'lmasin";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: widget.vm.phoneController,
                decoration: InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Telefon raqam bo'sh bo'lmasin";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: widget.vm.bioController,
                decoration: InputDecoration(labelText: "Bio"),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Bio bo'sh bo'lmasin";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Bekor qilish"),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final result = widget.vm.model.copyWith(
                image: widget.vm.imageUrlController.text.trim(),
                name: widget.vm.nameController.text.trim(),
                lastName: widget.vm.lastNameController.text.trim(),
                phoneNumber: widget.vm.phoneController.text.trim(),
                bio: widget.vm.bioController.text.trim(),
              );
              await widget.vm.updateModel(result);
              setState(() {
                widget.refresh();
              });
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            }
          },
          child: Text("Saqlash"),
        ),
      ],
    );
  }
}
