import 'package:flutter/material.dart';

class AccesosRapido extends StatefulWidget{
  const AccesosRapido ({super.key});

  @override

  State<AccesosRapido> createState() => _AccesosRapidoState();
}

class _AccesosRapidoState extends   State<AccesosRapido>{
  
  @override
  Widget build(BuildContext context){
   return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
       decoration: BoxDecoration(
        color: Colors.white,
         borderRadius: BorderRadius.circular(13),
         border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 7,
               offset: Offset(0, 3),
            )
          ],
       ),
         child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('Acceso Rapido',
                  style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 12,), 

                  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      _buildacceso(Icons.people, "Administrador", "5 registrado"),
                      _buildacceso(Icons.bar_chart, "Reportes", "Ver resumen"),
                     ],
                  ),
                  SizedBox(height: 12,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       _buildacceso(Icons.lock, "Usuarios", "4 Autorizados"),
                       _buildacceso(Icons.person, "Mi perfil", "Configuracion"),
                    ],
                   ),
            ],
         ),


   );

  }
     Widget _buildacceso(IconData icono, String titulo, String subtitulo){
      return Expanded(child: GestureDetector(
          onTap: (){
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:  Text('Acceso: $titulo'),
             ),);

          },
           child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
               constraints: const BoxConstraints(minHeight: 72),
                decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                ),
              
                     child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                              Icon(icono, size: 22, color: Color(0xFF86D1F8),),
                              SizedBox(width: 8,),
                               Expanded(
                                  child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                        Text(titulo, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 13,
                                        ),),
                                        Text(subtitulo, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
                                           color: Colors.grey,
                                           fontSize: 11,
                                   ),),
                               ],
                         ),
                     ),

                  ],
              ),
           ),
      ));
     }


}