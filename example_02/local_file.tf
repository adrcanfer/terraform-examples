resource "local_file" "productos" {
    count = 5
    content = "Lista de productos ${count.index}"
    filename = "./dist/productos-${random_string.sufijo[count.index].result}.txt"
}


