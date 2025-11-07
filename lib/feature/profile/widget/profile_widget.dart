import 'package:flutter/material.dart';
import '../../../models/user_model.dart';

class ProfileWidget extends StatefulWidget {
   UserModel user; // 🔹 Pass user model to this screen

   ProfileWidget(this.user);

  @override
  State<StatefulWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late TextEditingController _nameController;
  late TextEditingController _languageController;
  late TextEditingController _currencyController;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _languageController = TextEditingController(text: widget.user.language);
    _currencyController = TextEditingController(text: widget.user.currency);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _languageController.dispose();
    _currencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              if (_isEditing) {
                // 🔹 Save changes here (e.g. send to API or Firebase)
                setState(() {
                  widget.user.name = _nameController.text;
                  widget.user.language = _languageController.text;
                  widget.user.currency = _currencyController.text;
                });
              }
              setState(() => _isEditing = !_isEditing);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.03,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🧑‍💼 Header
              Center(
                child: Column(
                  children: [
                    const Icon(Icons.account_circle, size: 100, color: Colors.blueAccent),
                    Text(
                      widget.user.name,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.user.email,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 Info Fields
              _buildField("Name", _nameController, editable: true),
              _buildField("Email", TextEditingController(text: widget.user.email)),
              _buildField("Role", TextEditingController(text: widget.user.role)),
              _buildField("Status", TextEditingController(text: widget.user.status)),
              _buildField("Language", _languageController, editable: true),
              _buildField("Currency", _currencyController, editable: true),
              _buildField("Created At", TextEditingController(text: widget.user.createdAt)),
              _buildField("Updated At", TextEditingController(text: widget.user.updatedAt)),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Helper to build each info field
  Widget _buildField(String label, TextEditingController controller, {bool editable = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        enabled: editable && _isEditing,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: editable && _isEditing
              ? const Icon(Icons.edit, color: Colors.blueAccent)
              : null,
        ),
      ),
    );
  }
}
