class Categoria {
  final int? id;
  final String nombre;
  final String descripcion;
  final String? imagen;

  Categoria({
    this.id,
    required this.nombre,
    required this.descripcion,
    this.imagen,
  });

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'],
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      imagen: map['imagen'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'imagen': imagen,
    };
  }
}
