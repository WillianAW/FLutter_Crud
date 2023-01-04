import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  // final _formData = Map<String, String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário de Usuário'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            final isValid = _formKey.currentState!.validate();
            if (isValid) {
              _formKey.currentState!.save();
              Provider.of<Users>(context, listen: false).put(User(
                id: _formData ['id'],
                name: _formData['name']!,
                email: _formData['email']!,
                avatarUrl: _formData['avatarUrl']!,
              ),);
              Navigator.of(context).pop();
            }
          },
        )
      ]),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome Inválido';
                  }
                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno, no mínimo 3 letras';
                  }
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
