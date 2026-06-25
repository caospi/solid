# Analogías

## Principio de responsabilidad única

❌ En un restaurante, el mesero
  - Toma pedidos
  - Cocina
  - Lava platos
  - Cobra
  - Hace inventario

Si cambia el menu o falta un ingrediente el mesero debe cambiar su forma de trabajar y todo se vuelve un caos

✅ Cada persona debe tener una responsabilidad
  - Mesero -> toma pedidos
  - Cocinero -> Cocina
  - Cajero -> cobra
  - Bodeguero -> maneja inventario

## Principio de Abierto / Cerrado

Imagina que tienes un tomacorriente en la pared

  - Puedes conectar un Cargador de celular
  - Un televisor
  - Una licuadora
  - Un ventilador

El tomacorriente no necesita ser modificado cada vez que aparece un nuevo aparato.
Simplemente conectamos algo nuevo que cumpla el estandar y listo.

El sistema está:

- Cerrado para modificaciones → no hay que romper la pared ni cambiar la instalación.
- Abierto para extensiones → puedes conectar nuevos dispositivos.

## Principio de sustitución de Liskov

  Conducir diferentes carros

  Si alguilas

   - Un Toyota
   - Un renault
   - Un Mazda
   - Un electrico

  ✅ Esperas que todos tengan

  - Volante
  - Pedales
  - Frenos

  ❌ Imagina que alquilas un vehículo que parece un carro, pero:

  - El volante no gira.
  - El freno está en el techo.
  - Para arrancar debes abrir el baúl.

  Aunque lo llamen "carro", no se comporta como uno.

  ### Frase para recordar:

  - "Si parece un carro y se vende como carro, debería poder conducirse como un carro."

## Principio de segregación de interfaces

❌ Contratas un servicio de impresión que exige
  - Imprimir
  - Escanear
  - Fotocopiar
  - Redactar documentos

  Pero solo necesitas Imprimir

✅ Servicios separados
 - Impresora
 - Escaner
 - Persona encargada de redactar
 - Fotocopiadora

  Cada cliente usa unicamente lo que necesita

## Principio de Inversión de Dependencias

❌ Cuando llegues a un hotel, para pedir una toalla debes buscar a el empleado de limpieza

  - Si juan no esta todo falla
  
✅ Hablar con recepción

  - Recepción tiene una abstracción de **Servicio de habitación** Detrás pueden haber multiples empleados del áseo