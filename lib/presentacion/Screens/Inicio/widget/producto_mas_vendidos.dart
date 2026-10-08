import 'package:flutter/material.dart';

class ProductoMasVendidos extends StatelessWidget{
const ProductoMasVendidos ({super.key});

@override

Widget build(BuildContext context){
return Container(
  width: double.infinity,
padding: EdgeInsets.fromLTRB(24, 25, 24, 22),
margin: const EdgeInsets.all(16),
decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        )
      ]
),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
children: [
      Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Producto Mas vendidos',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),),
               const Spacer(),
               Text('Este mes',
               style: TextStyle(
                 fontSize: 13,
                 color: Colors.grey,
               ),),
               
            ],
      ),
      

     
      SizedBox(height: 13,),
      _buildProducto("Royal Canin Maxi 15kg" , "Alimento para perro.", 321, 0.9,
       colorBarra: Colors.orange),
      _buildProducto("Whiskas Adulto 10kg", "Alimento para gato.", 245, 0.7),

      _buildProducto("Shampoo Antipulgas", "Higiene.", 198, 0.6),
      _buildProducto("Shampoo Neutro Perro", "Higiene.", 167, 0.5),

      _buildProducto("Collar Ajustable", "Accesorios.", 134, 0.4),
      _buildProducto("Juguete Hueso", "Accesorios.",  100, 0.3),
],

),

);

}
  Widget _buildProducto(String nombre, String categoria, int unidades, double progreso,
  {Color colorBarra = const Color(0xFF86D1F8)})
  {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(nombre, style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),

             Text(categoria),
            SizedBox(height: 6,),
            Row(
              children: [
                  Expanded(
              child: LinearProgressIndicator(
              value: progreso,
              color: colorBarra,
              backgroundColor: Colors.grey[300],
              minHeight: 8,
            ),),
            SizedBox(width: 8,),
             Text('$unidades uds',
             style: TextStyle(
              fontWeight: FontWeight.bold,
             ),)

              ],

            )
           
        ],
      );



  }

}

