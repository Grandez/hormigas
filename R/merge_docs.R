# Version 1
# En lugar de ejecutar cda doc en su propio entorno, los cargamos todos en un unico
# documento
#
# Solo cargamos los capitulos con numero
#
# version 2: Ajustar el titulo en funcion del nivel de profundidad
# version 3: soportar yaml y quitarlo antes de la fusion

merge_docs = function (raiz = "chapters") {
   # Obtener los directorios que empiezan por numero
   dirs = list.dirs(path="chapters", recursive=F, full.names=F)
   dirs = sort(grep("^[0-9]", dirs, value=T))
   fulldirs = paste(raiz,dirs,sep="/")
   
   # Obtener la lista de documentos
   lfiles = lapply(fulldirs, function(d) list.files(path=d,pattern="^[0-9].+\\.qmd$", recursive=TRUE, full.names=T, ignore.case=T))
   vfiles = unlist(lfiles)
   
   #  files = list.files(path=raiz, pattern="^[0-9].+\\.qmd$", recursive=TRUE, full.names=T, ignore.case=T)
   #  files = sort(files)
   # 
    bloques = lapply(vfiles, function(archivo) {
              contenido = readLines(archivo, warn = FALSE)
              paste(contenido, collapse = "\n")
              })

   writeLines(paste0(bloques, collapse = "\n"))
}