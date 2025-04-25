import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/api_config.dart';
import 'package:flutter/services.dart';

class CallbackFormScreen extends StatefulWidget {
  const CallbackFormScreen({super.key});

  @override
  State<CallbackFormScreen> createState() => _CallbackFormScreenState();
}

class _CallbackFormScreenState extends State<CallbackFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController =
      TextEditingController(text: '+380');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  bool _isSubmitting = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      final response = await http.post(
        Uri.parse('$baseUrl/api/callbacks/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phone_number': _phoneController.text,
          'name': _nameController.text,
          'comment': _commentController.text,
        }),
      );

      setState(() => _isSubmitting = false);

      if (response.statusCode == 201) {
        Navigator.pushNamed(context, '/success');
        _formKey.currentState!.reset();
        _phoneController.text = '+380'; // сбрасываем с префиксом
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ошибка при отправке заявки.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказать звонок'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Телефон'),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[+0-9]')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите номер';
                  if (!RegExp(r'^\+380\d{9}$').hasMatch(value)) {
                    return 'Введите номер в формате +380XXXXXXXXX';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration:
                    const InputDecoration(labelText: 'Имя (необязательно)'),
              ),
              TextFormField(
                controller: _commentController,
                decoration: const InputDecoration(
                    labelText: 'Комментарий (необязательно)'),
                maxLines: 2,
              ),
              const SizedBox(height: 24),
              _isSubmitting
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: Colors.red.shade700,
                      ),
                      child: const Text('Отправить заявку'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
