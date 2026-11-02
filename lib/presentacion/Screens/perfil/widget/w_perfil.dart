import 'package:flutter/material.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/login/widget/w_login.dart';

class WPerfil extends StatefulWidget {
  const WPerfil({super.key});

  @override
  State<WPerfil> createState() => _WPerfilState();
}

class _WPerfilState extends State<WPerfil> {
  final TextEditingController nombreController = TextEditingController(
    text: 'Darell Jimenez',
  );

  final TextEditingController correoController = TextEditingController(
    text: 'jimenez@correo.com',
  );

  final TextEditingController telefonoController = TextEditingController(
    text: '505-9509-8928',
  );

  final TextEditingController contrasenaController = TextEditingController(
    text: '************',
  );

  final String administrador = 'Administrador';

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    contrasenaController.dispose();
    telefonoController.dispose();
    super.dispose();
  }

  void editarPerfil() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar perfil'),
          
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nombreController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 70, 72, 73),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),

                const SizedBox(height: 5),

                TextField(
                  controller: correoController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 70, 72, 73),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Correo',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 5),

                TextField(
                  controller: contrasenaController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 70, 72, 73),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 6),

                TextField(
                  controller: telefonoController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 70, 72, 73),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Telefono',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 110, 173, 204), // Color de fondo
                  foregroundColor: Colors.white, // Color del texto
                ),
              onPressed: () {
                setState(() {});
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Perfil actualizado')),
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
          colors: [Color.fromARGB(255, 101, 168, 197), Color(0xFF174B5B)],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            children: [
              const SizedBox(height: 1.0),
              const CircleAvatar(
                radius: 55,
                child: Icon(Icons.person, size: 70),
              ),
              const SizedBox(height: 12),

              Text(
                nombreController.text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                administrador,
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 197, 195, 195),
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 110, 173, 204), // Color de fondo
                  foregroundColor: Colors.white, // Color del texto
                ),
                onPressed: editarPerfil,
                icon: const Icon(Icons.edit),
                label: const Text('Editar perfil'),
              ),

              const SizedBox(height: 15),

              Card(
                child: Column(
                  children: [
                    SizedBox(height: 10),

                    Text(
                      'Información de la cuenta',
                      style: TextStyle(fontSize: 17),
                    ),

                    const Divider(height: 10),

                    ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: const Text('Nombre'),
                      subtitle: Text(nombreController.text),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(Icons.email_outlined),
                      title: const Text('Correo'),
                      subtitle: Text(correoController.text),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(Icons.phone_android_outlined),
                      title: const Text('Telefono'),
                      subtitle: Text(telefonoController.text),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: Icon(Icons.group_outlined),
                      title: Text('Rol asignado'),
                      subtitle: Text(administrador),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(Icons.lock_outline),
                      title: const Text('Contraseña'),
                      subtitle: Text(contrasenaController.text),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromARGB(255, 110, 173, 204), // Color de fondo
                  foregroundColor: Colors.white, // Color del texto
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => loginScreen()),
                    (route) => false,
                  );
                },
                child: const Text('Cerrar sesión'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
