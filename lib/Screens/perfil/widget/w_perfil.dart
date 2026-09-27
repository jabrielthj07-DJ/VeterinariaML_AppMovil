import 'package:flutter/material.dart';

class WPerfil extends StatefulWidget
{
  const WPerfil
  (
    {
      super.key,
    }
  );

  @override
  State<WPerfil> createState() => _WPerfilState();
}

class _WPerfilState extends State<WPerfil>
{
    final TextEditingController nombreController =
    TextEditingController(text: 'Axel Lopez');

    final TextEditingController correoController =
    TextEditingController(text: 'axellopez@gmail.com');

    final TextEditingController telefonoController =
    TextEditingController(text: '505-9509-8928');


  @override
  void dispose()
  {
    nombreController.dispose();
    correoController.dispose();
    super.dispose();
  }

  void editarPerfil()
  {
    showDialog
    (
      context: context,
      builder: (context)
      {
        return AlertDialog
        (
          title: const Text('Editar perfil'),

          content: SingleChildScrollView
          (
            child: Column
            (
              mainAxisSize: MainAxisSize.min,
              children:
              [
                TextField
                (
                  controller: nombreController,
                  decoration: const InputDecoration
                  (
                    labelText: 'Nombre',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),

                const SizedBox(height: 12),

                TextField
                (
                  controller: correoController,
                  decoration: const InputDecoration
                  (
                    labelText: 'Correo',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),

                TextField
                (
                  controller: telefonoController,
                  decoration: const InputDecoration
                  (
                    labelText: 'Correo',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),

              ],
            ),
          ),

          actions:
          [
            TextButton
            (
              onPressed: ()
              {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom 
              (
                foregroundColor: const Color.fromARGB(255, 7, 97, 143), 
              ),
              child: const Text('Cancelar'),
            ),

            ElevatedButton
            
            (
              onPressed: ()
              {
                
                setState(() {});
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar         
                (
                  const SnackBar
                  (
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
  Widget build(BuildContext context)
  {
    return SafeArea
    (
      child: SingleChildScrollView
      (
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),

        child: Column
        (
          children:
          [
            const SizedBox(height: 1.0),

            const CircleAvatar
            (
              backgroundColor: Color.fromARGB(255, 116, 197, 238),
              radius: 55,
              child: Icon
              (
                Icons.person,
                size: 70,
               color: Color.fromARGB(255, 7, 97, 143),
              ),
            ),

            const SizedBox(height: 12),

            Text
            (
              nombreController.text,

              style: const TextStyle
              (
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            const Text
            (
              'Cajero',

              style: TextStyle
              (
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon
            (
              onPressed: editarPerfil,

              style: ElevatedButton.styleFrom 
              (
                foregroundColor: const Color.fromARGB(255, 7, 97, 143), 
              ),

              icon: const Icon(Icons.edit),
              label: const Text('Editar perfil'),
            ),

            const SizedBox(height: 15),

            Card
            (
              child: Column
              (
                children:
                [
                  ListTile
                  (
                    leading: const Icon(Icons.person_outline),

                    title: const Text('Nombre'),

                    subtitle: Text(nombreController.text),
                  ),

                  const Divider(height: 1),

                  ListTile
                  (
                    leading: const Icon(Icons.email_outlined),

                    title: const Text('Correo'),

                    subtitle: Text(correoController.text),
                  ),

                  const Divider(height: 1),

                  ListTile
                  (
                    leading: const Icon(Icons.phone),

                    title: const Text('Telefono'),

                    subtitle: Text(telefonoController.text),
                  ),

                  const Divider(height: 1),

                  const ListTile
                  (
                    leading: Icon(Icons.lock_outline),

                    title: Text('Contraseña'),

                    subtitle: Text('**********'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}


