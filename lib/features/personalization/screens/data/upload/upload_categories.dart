import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/features/product/controllers/category_controller.dart';
import 'package:product_share_suzuki/features/product/models/category_model.dart';

class CategoryFormScreen extends StatefulWidget {
  @override
  _CategoryFormScreenState createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _parentIdController = TextEditingController();
  
  bool _isFeatured = false;
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: const GAppBar(
        showBackArrow: true,
        title: Text('Create Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
                 TextButton(
                onPressed: () async {
                  await CategoryController.instance.uploadCategoriesImage();
                },
                child: const Text('Select Image'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _parentIdController,
                decoration: const InputDecoration(
                  labelText: 'Parent ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text('Is Featured'),
                value: _isFeatured,
                onChanged: (value) {
                  setState(() {
                    _isFeatured = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    CategoryModel(
                      id: '',
                      name: _nameController.text,
                      image: _imageFile!.path,
                      parentId: _parentIdController.text,
                      isFeatured: _isFeatured,
                    );
                    await controller.uploadCategoriesImage();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Create Category'),

              ),
            ],
          ),
        ),
      ),
    );
  }
}