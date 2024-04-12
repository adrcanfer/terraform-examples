resource "local_file" "productos" {
    content = "Lista de productos"
    filename = "./dist/productos.txt"
}