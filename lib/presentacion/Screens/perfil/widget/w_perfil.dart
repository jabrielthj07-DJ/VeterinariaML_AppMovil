
import 'package:flutter/material.dart';
import 'package:veterinaria_ml_movil/presentacion/screens/login/widget/w_login.dart';

class WPerfil extends StatefulWidget {
  const WPerfil({super.key});

  @override
  State<WPerfil> createState() => _WPerfilState();
}

class _WPerfilState extends State<WPerfil> {

  static const Color azul = Color(0xFF174B5B);
  static const Color celeste = Color(0xFF7BD0F3);

  final nombreController = TextEditingController(text: 'Axel Lopez');
  final correoController = TextEditingController(text: 'axellopez@gmail.com');
  final telefonoController = TextEditingController(text: '505-9509-8928');

  final String administrador = 'Administrador';

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    telefonoController.dispose();
    super.dispose();
  }

  void editarPerfil() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Editar perfil',
            style: TextStyle(color: azul),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nombreController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: correoController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(labelText: 'Correo'),
                ),
                TextField(
                  controller: telefonoController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(labelText: 'Teléfono'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Perfil actualizado'),
                  ),
                );
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [azul, celeste],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 65,
                  color: azul,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                nombreController.text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                administrador,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton.icon(
                onPressed: editarPerfil,
                icon: const Icon(Icons.edit),
                label: const Text('Editar perfil'),
              ),

              const SizedBox(height: 25),

              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text(
                        'Información de la cuenta',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: azul,
                        ),
                      ),

                      const Divider(),

                      ListTile(
                        leading: const Icon(Icons.person_outline, color: azul),
                        title: const Text('Nombre'),
                        subtitle: Text(
                          nombreController.text,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),

                      ListTile(
                        leading: const Icon(Icons.email_outlined, color: azul),
                        title: const Text('Correo'),
                        subtitle: Text(
                          correoController.text,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),

                      ListTile(
                        leading: const Icon(Icons.phone, color: azul),
                        title: const Text('Teléfono'),
                        subtitle: Text(
                          telefonoController.text,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),

                      ListTile(
                        leading: const Icon(Icons.admin_panel_settings, color: azul),
                        title: const Text('Rol asignado'),
                        subtitle: Text(
                          administrador,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => loginScreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}